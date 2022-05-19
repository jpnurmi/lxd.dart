import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';

import 'api/certificate.dart';
import 'api/image.dart';
import 'api/instance.dart';
import 'api/instance_state.dart';
import 'api/network.dart';
import 'api/network_acl.dart';
import 'api/operation.dart';
import 'api/profile.dart';
import 'api/project.dart';
import 'api/resource.dart';
import 'api/storage_pool.dart';
import 'remote_image.dart';
import 'simplestream_client.dart';

const _certificatePath = '/1.0/certificates/';
const _instancePath = '/1.0/instances/';
const _imagePath = '/1.0/images/';
const _networkPath = '/1.0/networks/';
const _networkAclPath = '/1.0/network-acls/';
const _operationPath = '/1.0/operations/';
const _profilePath = '/1.0/profiles/';
const _projectPath = '/1.0/projects/';
const _storagePoolPath = '/1.0/storage-pools/';

/// General response from lxd.
abstract class _LxdResponse {
  /// Request result. Throws an exception if not a sync result.
  dynamic get result;

  /// Request operation. Throws an exception if not an async result.
  LxdOperation get operation;

  const _LxdResponse();
}

/// Response retuned when a sync request is completed.
class _LxdSyncResponse extends _LxdResponse {
  final int statusCode;

  final String status;

  final dynamic _result;

  @override
  dynamic get result => _result;

  @override
  LxdOperation get operation => throw 'Result is sync';

  _LxdSyncResponse(dynamic result,
      {required this.statusCode, required this.status})
      : _result = result;
}

/// Response retuned when an async request has been started.
class _LxdAsyncResponse extends _LxdResponse {
  final int statusCode;

  final String status;

  final LxdOperation _operation;

  @override
  dynamic get result => throw 'Result is async';

  @override
  LxdOperation get operation => _operation;

  _LxdAsyncResponse(LxdOperation operation,
      {required this.statusCode, required this.status})
      : _operation = operation;
}

/// Response retuned when an error occurred.
class _LxdErrorResponse extends _LxdResponse {
  // Error code.
  final int errorCode;

  /// Error message returned.
  final String error;

  @override
  dynamic get result => throw 'Result is error: $error';

  @override
  LxdOperation get operation => throw 'Result is error: $error';

  const _LxdErrorResponse({required this.errorCode, required this.error});
}

/// Manages a connection to the lxd server.
class LxdClient {
  final HttpClient _client;
  String? _userAgent;

  dynamic _hostInfo;

  LxdClient(
      {String userAgent = 'lxd.dart',
      String? socketPath,
      @visibleForTesting HttpClient? client})
      : assert(socketPath == null || client == null),
        _client = client ?? _createClient(socketPath),
        _userAgent = userAgent;

  static HttpClient _createClient(String? socketPath) {
    final client = HttpClient();
    client.connectionFactory =
        (Uri uri, String? proxyHost, int? proxyPort) async {
      if (socketPath == null) {
        var lxdDir = Platform.environment['LXD_DIR'];
        var snapSocketPath = '/var/snap/lxd/common/lxd/unix.socket';
        if (lxdDir != null) {
          socketPath = lxdDir + '/unix.socket';
        } else if (await File(snapSocketPath).exists()) {
          socketPath = snapSocketPath;
        } else {
          socketPath = '/var/lib/lxd/unix.socket';
        }
      }
      var address =
          InternetAddress(socketPath!, type: InternetAddressType.unix);
      return Socket.startConnect(address, 0);
    };
    return client;
  }

  /// Sets the user agent sent in requests to lxd.
  set userAgent(String? value) => _userAgent = value;

  /// Get the operations in progress (keyed by type).
  Future<Map<String, List<String>>> getOperations() async {
    var operationPaths = await _requestSync('GET', '/1.0/operations');
    var operationIds = <String, List<String>>{};
    for (var type in operationPaths.keys) {
      var ids = <String>[];
      for (var path in operationPaths[type]) {
        if (path.startsWith(_operationPath)) {
          ids.add(path.substring(_operationPath.length));
        }
      }
      operationIds[type] = ids;
    }

    return operationIds;
  }

  /// Get the current state of the operation with [id].
  Future<LxdOperation> getOperation(String id) async {
    var response = await _requestSync('GET', '/1.0/operations/$id');
    return LxdOperation.fromJson(response);
  }

  /// Wait for the operation with [id] to complete.
  Future<LxdOperation> waitOperation(String id) async {
    var response = await _requestSync('GET', '/1.0/operations/$id/wait');
    return LxdOperation.fromJson(response);
  }

  /// Cancel the operation with [id].
  Future<void> cancelOperation(String id) async {
    await _requestSync('DELETE', '/1.0/operations/$id');
  }

  /// Gets system resources information.
  Future<LxdResources> getResources() async {
    var data = await _requestSync('GET', '/1.0/resources');
    return LxdResources.fromJson(data);
  }

  /// Gets the fingerprints of the certificates provided by the LXD server.
  Future<List<String>> getCertificates() async {
    var certificatePaths = await _requestSync('GET', '/1.0/certificates');
    var fingerprints = <String>[];
    for (var path in certificatePaths) {
      if (path.startsWith(_certificatePath)) {
        fingerprints.add(path.substring(_certificatePath.length));
      }
    }
    return fingerprints;
  }

  /// Gets information on a certificate with [fingerprint].
  Future<LxdCertificate> getCertificate(String fingerprint) async {
    var certificate =
        await _requestSync('GET', '/1.0/certificates/$fingerprint');
    return LxdCertificate.fromJson(certificate);
  }

  /// Gets the fingerprints of the images provided by the LXD server.
  Future<List<String>> getImages({String? project, String? filter}) async {
    var parameters = <String, String>{};
    if (project != null) {
      parameters['project'] = project;
    }
    if (filter != null) {
      parameters['filter'] = filter;
    }
    var imagePaths = await _requestSync('GET', '/1.0/images', parameters);
    var fingerprints = <String>[];
    for (var path in imagePaths) {
      if (path.startsWith(_imagePath)) {
        fingerprints.add(path.substring(_imagePath.length));
      }
    }
    return fingerprints;
  }

  /// Gets information on an image with [fingerprint].
  Future<LxdImage> getImage(String fingerprint) async {
    var image = await _requestSync('GET', '/1.0/images/$fingerprint');
    return LxdImage.fromJson(image);
  }

  /// Gets the remote images available on the Simplestreams server at [url].
  Future<List<LxdRemoteImage>> getRemoteImages(String url) async {
    var s = SimplestreamClient(url);

    var images = <LxdRemoteImage>[];
    var products = await s.getProducts(datatype: 'image-downloads');
    for (var product in products) {
      images.addAll(_getRemoteImages(url, product));
    }

    s.close();

    return images;
  }

  /// Finds the image with [name] (alias or fingeprint) on the Simplestreams server at [url].
  Future<LxdRemoteImage?> findRemoteImage(String url, String name) async {
    await _connect();
    var architecture = _hostInfo['environment']['architectures'][0] ?? '';

    var s = SimplestreamClient(url);

    var products = await s.getProducts(datatype: 'image-downloads');
    for (var product in products) {
      if (!product.aliases.contains(name) ||
          _getArchitecture(product.architecture ?? '') != architecture) {
        continue;
      }

      var images = _getRemoteImages(url, product);
      if (images.isNotEmpty) {
        s.close();
        return images.first;
      }
    }

    s.close();
    return null;
  }

  List<LxdRemoteImage> _getRemoteImages(
      String url, SimplestreamProduct product) {
    var images = <LxdRemoteImage>[];

    for (var v in product.versions.values) {
      var lxdItem = v['lxd.tar.xz'] as SimplestreamDownloadItem?;
      if (lxdItem == null) {
        continue;
      }

      var description = '${product.os ?? ''} ${product.releaseTitle ?? ''}';

      if (lxdItem.combinedSquashfsSha256 != null) {
        var squashfsItem = v['squashfs'] as SimplestreamDownloadItem;
        images.add(LxdRemoteImage(
            architecture: product.architecture ?? '',
            aliases: product.aliases,
            description: description,
            fingerprint: lxdItem.combinedSquashfsSha256!,
            size: squashfsItem.size,
            type: LxdRemoteImageType.container,
            url: url));
      } else if (lxdItem.combinedDisk1ImgSha256 != null) {
        var disk1ImgItem = v['disk1.img'] as SimplestreamDownloadItem;
        images.add(LxdRemoteImage(
            architecture: product.architecture ?? '',
            aliases: product.aliases,
            description: description,
            fingerprint: lxdItem.combinedDisk1ImgSha256!,
            size: disk1ImgItem.size,
            type: LxdRemoteImageType.virtualMachine,
            url: url));
      }
    }

    return images;
  }

  /// Get the canonical name for [architecture].
  String _getArchitecture(String architecture) {
    const aliases = <String, List<String>>{
      'i686': ['i386', 'i586', '386', 'x86', 'generic_32'],
      'x86_64': ['amd64', 'generic_64'],
      'armv7l': [
        'armel',
        'armhf',
        'arm',
        'armhfp',
        'armv7a_hardfp',
        'armv7',
        'armv7a_vfpv3_hardfp'
      ],
      'aarch64': ['arm64', 'arm64_generic'],
      'ppc': ['powerpc'],
      'ppc64': ['powerpc64', 'ppc64'],
      'ppc64le': ['ppc64el'],
      's390x': ['mipsel'],
      'mips': ['mips64el'],
      'mips64': [],
      'riscv32': [],
      'riscv64': []
    };

    for (var name in aliases.keys) {
      if (architecture == name ||
          (aliases[name]?.contains(architecture) ?? false)) {
        return name;
      }
    }

    return architecture;
  }

  /// Gets the names of the instances provided by the LXD server.
  Future<List<String>> getInstances() async {
    var instancePaths = await _requestSync('GET', '/1.0/instances');
    var instanceNames = <String>[];
    for (var path in instancePaths) {
      if (path.startsWith(_instancePath)) {
        instanceNames.add(path.substring(_instancePath.length));
      }
    }
    return instanceNames;
  }

  /// Gets information on the instance with [name].
  Future<LxdInstance> getInstance(String name) async {
    var instance = await _requestSync('GET', '/1.0/instances/$name');
    return LxdInstance.fromJson(instance);
  }

  /// Gets runtime state of the instance with [name].
  Future<LxdInstanceState> getInstanceState(String name) async {
    var state = await _requestSync('GET', '/1.0/instances/$name/state');
    return LxdInstanceState.fromJson(state);
  }

  /// Creates a new instance from [image].
  Future<LxdOperation> createInstance(
      {String? architecture,
      String? description,
      String? name,
      required LxdRemoteImage image}) async {
    var body = {};
    if (architecture != null) {
      body['architecture'] = architecture;
    }
    if (description != null) {
      body['description'] = description;
    }
    if (name != null) {
      body['name'] = name;
    }
    var s = {};
    s['type'] = 'image';
    s['fingerprint'] = image.fingerprint;
    s['protocol'] = 'simplestreams';
    s['server'] = image.url;
    body['source'] = s;
    return await _requestAsync('POST', '/1.0/instances', body);
  }

  /// Starts the instance with [name].
  Future<LxdOperation> startInstance(String name, {bool force = false}) async {
    return await _requestAsync('PUT', '/1.0/instances/$name/state',
        {'action': 'start', 'force': force});
  }

  /// Stops the instance with [name].
  Future<LxdOperation> stopInstance(String name, {bool force = false}) async {
    return await _requestAsync('PUT', '/1.0/instances/$name/state',
        {'action': 'stop', 'force': force});
  }

  /// Restarts the instance with [name].
  Future<LxdOperation> restartInstance(String name,
      {bool force = false}) async {
    return await _requestAsync('PUT', '/1.0/instances/$name/state',
        {'action': 'restart', 'force': force});
  }

  /// Deletes the instance with [name].
  Future<LxdOperation> deleteInstance(String name) async {
    return await _requestAsync('DELETE', '/1.0/instances/$name');
  }

  /// Gets the names of the networks provided by the LXD server.
  Future<List<String>> getNetworks() async {
    var networkPaths = await _requestSync('GET', '/1.0/networks');
    var networkNames = <String>[];
    for (var path in networkPaths) {
      if (path.startsWith(_networkPath)) {
        networkNames.add(path.substring(_networkPath.length));
      }
    }
    return networkNames;
  }

  /// Gets information on the network with [name].
  Future<LxdNetwork> getNetwork(String name) async {
    var network = await _requestSync('GET', '/1.0/networks/$name');
    return LxdNetwork.fromJson(network);
  }

  /// Gets DHCP leases on the network with [name].
  Future<List<LxdNetworkLease>> getNetworkLeases(String name) async {
    var leaseList = await _requestSync('GET', '/1.0/networks/$name/leases');
    var leases = <LxdNetworkLease>[];
    for (var lease in leaseList) {
      leases.add(LxdNetworkLease.fromJson(lease));
    }
    return leases;
  }

  /// Gets the current network state of the network with [name].
  Future<LxdNetworkState> getNetworkState(String name) async {
    var state = await _requestSync('GET', '/1.0/networks/$name/state');
    return LxdNetworkState.fromJson(state);
  }

  /// Gets the names of the network ACLs provided by the LXD server.
  Future<List<String>> getNetworkAcls() async {
    var aclPaths = await _requestSync('GET', '/1.0/network-acls');
    var aclNames = <String>[];
    for (var path in aclPaths) {
      if (path.startsWith(_networkAclPath)) {
        aclNames.add(path.substring(_networkAclPath.length));
      }
    }
    return aclNames;
  }

  /// Gets information on the network ACL with [name].
  Future<LxdNetworkAcl> getNetworkAcl(String name) async {
    var acl = await _requestSync('GET', '/1.0/network-acls/$name');
    return LxdNetworkAcl.fromJson(acl);
  }

  /// Gets the names of the profiles provided by the LXD server.
  Future<List<String>> getProfiles() async {
    var profilePaths = await _requestSync('GET', '/1.0/profiles');
    var profileNames = <String>[];
    for (var path in profilePaths) {
      if (path.startsWith(_profilePath)) {
        profileNames.add(path.substring(_profilePath.length));
      }
    }
    return profileNames;
  }

  /// Gets information on the profile with [name].
  Future<LxdProfile> getProfile(String name) async {
    var profile = await _requestSync('GET', '/1.0/profiles/$name');
    return LxdProfile.fromJson(profile);
  }

  /// Gets the names of the projects provided by the LXD server.
  Future<List<String>> getProjects() async {
    var projectPaths = await _requestSync('GET', '/1.0/projects');
    var projectNames = <String>[];
    for (var path in projectPaths) {
      if (path.startsWith(_projectPath)) {
        projectNames.add(path.substring(_projectPath.length));
      }
    }
    return projectNames;
  }

  /// Gets information on the project with [name].
  Future<LxdProject> getProject(String name) async {
    var project = await _requestSync('GET', '/1.0/projects/$name');
    return LxdProject.fromJson(project);
  }

  /// Gets the names of the storage pools provided by the LXD server.
  Future<List<String>> getStoragePools() async {
    var poolPaths = await _requestSync('GET', '/1.0/storage-pools');
    var poolNames = <String>[];
    for (var path in poolPaths) {
      if (path.startsWith(_storagePoolPath)) {
        poolNames.add(path.substring(_storagePoolPath.length));
      }
    }
    return poolNames;
  }

  /// Gets information on the pool with [name].
  Future<LxdStoragePool> getStoragePool(String name) async {
    var pool = await _requestSync('GET', '/1.0/storage-pools/$name');
    return LxdStoragePool.fromJson(pool);
  }

  /// Terminates all active connections. If a client remains unclosed, the Dart process may not terminate.
  void close() {
    _client.close();
  }

  Future<void> _connect() async {
    _hostInfo ??= await _requestSync('GET', '/1.0');
  }

  /// Does a synchronous request to lxd.
  Future<dynamic> _requestSync(String method, String path,
      [Map<String, String> queryParameters = const {}]) async {
    // Get host information first.
    if (method != 'GET' || path != '/1.0') {
      await _connect();
    }
    var request = await _client.openUrl(
        method, Uri.http('localhost', path, queryParameters));
    _setHeaders(request);
    await request.close();
    var lxdResponse = await _parseResponse(await request.done);
    return lxdResponse.result;
  }

  /// Does an asynchronous request to lxd.
  Future<dynamic> _requestAsync(String method, String path,
      [dynamic body]) async {
    await _connect();
    var request = await _client.openUrl(method, Uri.http('localhost', path));
    _setHeaders(request);
    request.headers.contentType = ContentType('application', 'json');
    request.write(json.encode(body));
    await request.close();
    var lxdResponse = await _parseResponse(await request.done);
    return lxdResponse.operation;
  }

  /// Makes base HTTP headers to send.
  void _setHeaders(HttpClientRequest request) {
    if (_userAgent != null) {
      request.headers.set(HttpHeaders.userAgentHeader, _userAgent!);
    }
  }

  /// Decodes a response from lxd.
  Future<_LxdResponse> _parseResponse(HttpClientResponse response) async {
    var body = await response.transform(utf8.decoder).join();
    var jsonResponse = json.decode(body);
    _LxdResponse lxdResponse;
    var type = jsonResponse['type'];
    if (type == 'sync') {
      var statusCode = jsonResponse['status_code'];
      var status = jsonResponse['status'];
      lxdResponse = _LxdSyncResponse(jsonResponse['metadata'],
          statusCode: statusCode, status: status);
    } else if (type == 'async') {
      var statusCode = jsonResponse['status_code'];
      var status = jsonResponse['status'];
      var metadata = jsonResponse['metadata'];
      lxdResponse = _LxdAsyncResponse(LxdOperation.fromJson(metadata),
          statusCode: statusCode, status: status);
    } else if (type == 'error') {
      var errorCode = jsonResponse['error_code'];
      var error = jsonResponse['error'];
      lxdResponse = _LxdErrorResponse(errorCode: errorCode, error: error);
    } else {
      throw "Unknown lxd response '$type'";
    }

    return lxdResponse;
  }
}

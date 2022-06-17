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
import 'event.dart';
import 'exception.dart';
import 'response.dart';

const _certificatePath = '/1.0/certificates/';
const _instancePath = '/1.0/instances/';
const _imagePath = '/1.0/images/';
const _networkPath = '/1.0/networks/';
const _networkAclPath = '/1.0/network-acls/';
const _operationPath = '/1.0/operations/';
const _profilePath = '/1.0/profiles/';
const _projectPath = '/1.0/projects/';
const _storagePoolPath = '/1.0/storage-pools/';

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

  /// Get a websocket connection for the provided operation.
  Future<WebSocket> getOperationWebSocket(String id, String secret) {
    return WebSocket.connect(
      'ws://localhost/1.0/operations/$id/websocket?secret=$secret',
      customClient: _client,
    );
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

  /// Gets a stream of LXD events.
  Stream<LxdEvent> getEvents({
    String project = '',
    Set<LxdEventType> types = const {},
  }) async* {
    final url = Uri(
      scheme: 'ws',
      host: 'localhost',
      path: '/1.0/events',
      queryParameters: {
        if (project.isNotEmpty) 'project': project,
        if (types.isNotEmpty) 'type': types.map((t) => t.name).join(','),
      },
    );
    final ws = await WebSocket.connect(url.toString(), customClient: _client);
    try {
      await for (final event in ws) {
        yield LxdEvent.fromJson(json.decode(event.toString()));
      }
    } finally {
      await ws.close();
    }
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
  Future<LxdOperation> createInstance({
    // InstancePut
    String? architecture,
    Map<String, String>? config,
    Map<String, Map<String, String>>? devices,
    bool? ephemeral,
    List<String>? profiles,
    String? restore,
    bool? stateful,
    String? description,
    // InstancesPost
    String? name,
    // TODO: InstanceSource
    required LxdImage source,
    String? server,
    String? instanceType,
    LxdImageType? type,
  }) async {
    final body = {
      if (architecture != null) 'architecture': architecture,
      if (config != null) 'config': config,
      if (devices != null) 'devices': devices,
      if (ephemeral != null) 'ephemeral': ephemeral,
      if (profiles != null) 'profiles': profiles,
      if (restore != null) 'restore': restore,
      if (stateful != null) 'stateful': stateful,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      'source': {
        ...source.toJson(), // TODO: InstanceSource
        'type': 'image',
        if (server != null) 'protocol': 'simplestreams',
        if (server != null) 'server': server,
      },
      if (instanceType != null) 'type': instanceType,
      if (type != null) 'type': type.name,
    };
    return await _requestAsync('POST', '/1.0/instances', body);
  }

  /// Starts the instance with [name].
  Future<LxdOperation> startInstance(String name, {bool force = false}) async {
    return await _requestAsync('PUT', '/1.0/instances/$name/state',
        {'action': 'start', 'force': force});
  }

  /// Executes a command in the instance with [name].
  Future<LxdOperation> execInstance(
    String name, {
    required List<String> command,
    String? workingDirectory,
    Map<String, String>? environment,
    int? user,
    int? group,
    bool? interactive,
    bool? recordOutput,
    int? width,
    int? height,
    bool? waitForWebSocket,
  }) async {
    // TODO: which parameters are required?
    return await _requestAsync('POST', '/1.0/instances/$name/exec', {
      'command': command,
      if (workingDirectory != null) 'cwd': workingDirectory,
      if (environment != null) 'environment': environment,
      if (user != null) 'user': user,
      if (group != null) 'group': group,
      if (interactive != null) 'interactive': interactive,
      if (recordOutput != null) 'record-output': recordOutput,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (waitForWebSocket != null) 'wait-for-websocket': waitForWebSocket,
    });
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
    var lxdResponse = await _parseResponse<LxdSyncResponse>(await request.done);
    return lxdResponse.metadata;
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
    var lxdResponse =
        await _parseResponse<LxdAsyncResponse>(await request.done);
    return LxdOperation.fromJson(lxdResponse.metadata);
  }

  /// Makes base HTTP headers to send.
  void _setHeaders(HttpClientRequest request) {
    if (_userAgent != null) {
      request.headers.set(HttpHeaders.userAgentHeader, _userAgent!);
    }
  }

  /// Decodes a response from lxd.
  Future<T> _parseResponse<T>(HttpClientResponse data) async {
    var body = await data.transform(utf8.decoder).join();
    var response = LxdResponse.fromJson(json.decode(body));
    if (response is LxdErrorResponse) {
      throw LxdException(response.errorCode, error: response.error);
    }
    return response as T;
  }
}

extension LxdWebSocket on WebSocket {
  void sendTermSize(int width, int height) {
    add(jsonEncode({
      'command': 'window-resize',
      'args': {'width': '$width', 'height': '$height'},
    }));
  }

  void forwardSignal(int signal) {
    add(jsonEncode({'command': 'signal', 'signal': signal}));
  }
}

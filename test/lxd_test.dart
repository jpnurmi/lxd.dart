import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:test/test.dart';

class MockProject {
  final Map<String, dynamic> config;
  final String description;

  MockProject({this.config = const {}, this.description = ''});
}

class MockStoragePool {
  final Map<String, dynamic> config;
  final String description;
  final String status;

  MockStoragePool(
      {this.config = const {}, this.description = '', this.status = ''});
}

class MockOperation {
  final String id;
  final String type;
  final String description;
  final String createdAt;
  final String updatedAt;
  String status;
  final int statusCode;
  final Map<String, dynamic> resources;
  final Map<String, dynamic>? metadata;
  final bool mayCancel;
  final String? error;
  final String location;

  MockOperation(
      {required this.id,
      this.type = 'task',
      this.description = '',
      this.createdAt = '1970-01-01',
      this.updatedAt = '1970-01-01',
      this.status = '',
      this.statusCode = 0,
      this.resources = const {},
      this.metadata,
      this.mayCancel = false,
      this.error,
      this.location = ''});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'class': type,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'status_code': statusCode,
      'resources': resources,
      'metadata': metadata,
      'may_cancel': false,
      'err': error ?? '',
      'location': location,
    };
  }
}

class MockLxdServer {
  Directory? _tempDir;
  String? _socketPath;
  HttpServer? _server;
  ServerSocket? _unixSocket;
  StreamSubscription<Socket>? _unixSubscription;
  StreamSubscription<HttpRequest>? _requestSubscription;
  final _tcpSockets = <Socket, Socket>{};

  final operations = <String, MockOperation>{};
  final Map<String, MockProject> projects;
  final Map<String, MockStoragePool> storagePools;

  String get socketPath => _socketPath!;

  MockLxdServer({this.projects = const {}, this.storagePools = const {}});

  Future<void> start() async {
    _tempDir = await Directory.systemTemp.createTemp();
    _socketPath = '${_tempDir!.path}/unix.socket';

    // Due to a bug in HttpServer, bridge from a Unix socket to a TCP/IP socket
    // https://github.com/dart-lang/sdk/issues/45977
    _server = await HttpServer.bind(InternetAddress.anyIPv4, 0);
    _requestSubscription = _server?.listen(_processRequest);
    _unixSocket = await ServerSocket.bind(
        InternetAddress(_socketPath!, type: InternetAddressType.unix), 0);
    _unixSubscription = _unixSocket?.listen((socket) async {
      var tcpSocket = await Socket.connect(_server!.address, _server!.port);
      _tcpSockets[socket] = tcpSocket;
      socket.listen((data) => tcpSocket.add(data),
          onDone: () => tcpSocket.close());
      tcpSocket.listen((data) => socket.add(data),
          onDone: () => socket.close());
    });
  }

  void _processRequest(HttpRequest request) {
    var response = request.response;
    var path = request.uri.path.startsWith('/')
        ? request.uri.path.substring(1).split('/')
        : [];
    if (request.method == 'GET' && path.length == 1 && path[0] == '1.0') {
      _getHostInfo(response);
    } else if (request.method == 'GET' &&
        path.length == 2 &&
        path[0] == '1.0' &&
        path[1] == 'operations') {
      _getOperations(response);
    } else if (request.method == 'GET' &&
        path.length == 3 &&
        path[0] == '1.0' &&
        path[1] == 'operations') {
      var id = path[2];
      _getOperation(response, id);
    } else if (request.method == 'GET' &&
        path.length == 4 &&
        path[0] == '1.0' &&
        path[1] == 'operations' &&
        path[3] == 'wait') {
      var id = path[2];
      _waitOperation(response, id);
    } else if (request.method == 'DELETE' &&
        path.length == 3 &&
        path[0] == '1.0' &&
        path[1] == 'operations') {
      var id = path[2];
      _deleteOperation(response, id);
    } else if (request.method == 'GET' &&
        path.length == 2 &&
        path[0] == '1.0' &&
        path[1] == 'projects') {
      _getProjects(response);
    } else if (request.method == 'GET' &&
        path.length == 3 &&
        path[0] == '1.0' &&
        path[1] == 'projects') {
      var name = path[2];
      _getProject(response, name);
    } else if (request.method == 'GET' &&
        path.length == 2 &&
        path[0] == '1.0' &&
        path[1] == 'storage-pools') {
      _getStoragePools(response);
    } else if (request.method == 'GET' &&
        path.length == 3 &&
        path[0] == '1.0' &&
        path[1] == 'storage-pools') {
      var name = path[2];
      _getStoragePool(response, name);
    } else {
      response.statusCode = HttpStatus.notFound;
      _writeErrorResponse(response, 'not found');
    }
    response.close();
  }

  void _getHostInfo(HttpResponse response) {
    _writeSyncResponse(response, {
      'config': {},
      'api_extensions': [],
      'api_status': 'stable',
      'api_version': '1.0',
      'auth': 'trusted',
      'public': false,
      'auth_methods': ['tls'],
      'environment': {}
    });
  }

  void _getOperations(HttpResponse response) {
    _writeSyncResponse(response, {
      'running': operations.keys.map((id) => '/1.0/operations/$id').toList()
    });
  }

  void _getOperation(HttpResponse response, String id) {
    _writeSyncResponse(response, operations[id]!.toJson());
  }

  void _waitOperation(HttpResponse response, String id) {
    var operation = operations[id]!;
    operation.status = 'done';
    _writeSyncResponse(response, operation.toJson());
  }

  void _deleteOperation(HttpResponse response, String id) {
    var operation = operations[id]!;
    operation.status = 'cancelled';
    _writeSyncResponse(response, {});
  }

  void _getProjects(HttpResponse response) {
    _writeSyncResponse(
        response, projects.keys.map((name) => '/1.0/projects/$name').toList());
  }

  void _getProject(HttpResponse response, String name) {
    var project = projects[name]!;
    _writeSyncResponse(response, {
      'config': project.config,
      'description': project.description,
      'name': name
    });
  }

  void _getStoragePools(HttpResponse response) {
    _writeSyncResponse(response,
        storagePools.keys.map((name) => '/1.0/storage-pools/$name').toList());
  }

  void _getStoragePool(HttpResponse response, String name) {
    var pool = storagePools[name]!;
    _writeSyncResponse(response, {
      'config': pool.config,
      'description': pool.description,
      'name': name,
      'status': pool.status
    });
  }

  MockOperation _addOperation({String description = '', String status = ''}) {
    var id = operations.length.toString();
    var operation =
        MockOperation(description: description, id: id, status: status);
    operations[id] = operation;
    return operation;
  }

  void _writeSyncResponse(HttpResponse response, dynamic metadata) {
    _writeJson(response, {
      'type': 'sync',
      'status': 'Success',
      'status_code': response.statusCode,
      'metadata': metadata
    });
  }

  void _writeAsyncResponse(HttpResponse response, [dynamic metadata]) {
    _writeJson(response, {
      'type': 'async',
      'status': '',
      'status_code': response.statusCode,
      'metadata': metadata
    });
  }

  void _writeErrorResponse(HttpResponse response, String message) {
    _writeJson(response,
        {'type': 'error', 'error_code': response.statusCode, 'error': message});
  }

  void _writeJson(HttpResponse response, dynamic value) {
    var data = utf8.encode(json.encode(value));
    response.headers.contentType = ContentType('application', 'json');
    response.headers.contentLength = data.length;
    response.add(data);
  }

  Future<void> close() async {
    await _requestSubscription?.cancel();
    await _unixSubscription?.cancel();
    for (var socket in _tcpSockets.values) {
      await socket.close();
    }
    await _tempDir?.delete(recursive: true);
  }
}

void main() {
  test('get projects', () async {
    var lxd = MockLxdServer(
        projects: {'default': MockProject(), 'foo': MockProject()});
    await lxd.start();

    var client = LxdClient(socketPath: lxd.socketPath);
    var projectNames = await client.getProjects();
    expect(projectNames, equals(['default', 'foo']));

    client.close();
    await lxd.close();
  });

  test('get project', () async {
    var lxd = MockLxdServer(projects: {
      'foo': MockProject(
          config: {'features.networks': 'false', 'features.profiles': 'true'},
          description: 'My new project')
    });
    await lxd.start();

    var client = LxdClient(socketPath: lxd.socketPath);
    var project = await client.getProject('foo');
    expect(project.config,
        equals({'features.networks': 'false', 'features.profiles': 'true'}));
    expect(project.description, equals('My new project'));
    expect(project.name, equals('foo'));

    client.close();
    await lxd.close();
  });

  test('get storage pools', () async {
    var lxd = MockLxdServer(storagePools: {
      'local': MockStoragePool(),
      'remote': MockStoragePool()
    });
    await lxd.start();

    var client = LxdClient(socketPath: lxd.socketPath);
    var poolNames = await client.getStoragePools();
    expect(poolNames, equals(['local', 'remote']));

    client.close();
    await lxd.close();
  });

  test('get storage pool', () async {
    var lxd = MockLxdServer(storagePools: {
      'local': MockStoragePool(
          config: {'volume.block.filesystem': 'ext4', 'volume.size': '50GiB'},
          description: 'Local SSD pool',
          status: 'Created')
    });
    await lxd.start();

    var client = LxdClient(socketPath: lxd.socketPath);
    var pool = await client.getStoragePool('local');
    expect(pool.config,
        equals({'volume.block.filesystem': 'ext4', 'volume.size': '50GiB'}));
    expect(pool.description, equals('Local SSD pool'));
    expect(pool.name, equals('local'));
    expect(pool.status, equals('Created'));

    client.close();
    await lxd.close();
  });

  test('get operations', () async {
    var lxd = MockLxdServer();
    await lxd.start();

    var client = LxdClient(socketPath: lxd.socketPath);
    var operation1 = await client.startInstance('test-instance1');
    var operation2 = await client.startInstance('test-instance2');
    var operation3 = await client.startInstance('test-instance3');

    var operations = await client.getOperations();
    expect(
        operations,
        equals({
          'running': [operation1.id, operation2.id, operation3.id]
        }));

    var operation = await client.getOperation(operation1.id);
    expect(operation.id, equals(operation1.id));

    client.close();
    await lxd.close();
  });

  test('cancel operation', () async {
    var lxd = MockLxdServer();
    await lxd.start();

    var client = LxdClient(socketPath: lxd.socketPath);
    var operation = await client.startInstance('test-instance1');

    await client.cancelOperation(operation.id);

    operation = await client.getOperation(operation.id);
    expect(operation.status, equals('cancelled'));

    client.close();
    await lxd.close();
  });
}

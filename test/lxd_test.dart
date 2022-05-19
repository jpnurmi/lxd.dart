import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lxd/lxd.dart';
import 'package:test/test.dart';

class MockLxdServer {
  Directory? _tempDir;
  String? _socketPath;
  HttpServer? _server;
  ServerSocket? _unixSocket;
  StreamSubscription<Socket>? _unixSubscription;
  StreamSubscription<HttpRequest>? _requestSubscription;
  final _tcpSockets = <Socket, Socket>{};

  String get socketPath => _socketPath!;

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

void main() {}

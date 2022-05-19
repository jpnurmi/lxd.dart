import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get operations', () async {
    const response = {
      'running': ['/1.0/operations/foo', '/1.0/operations/bar'],
    };

    final http = mockHttpClient();
    final uri = Uri.http('localhost', '/1.0/operations', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final operations = await client.getOperations();
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(
      operations,
      equals({
        'running': ['foo', 'bar']
      }),
    );
  });

  test('cancel operation', () async {
    final http = mockHttpClient();
    final uri = Uri.http('localhost', '/1.0/operations/foo', {});
    final request = mockResponse(null);
    when(http.openUrl('DELETE', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    await client.cancelOperation('foo');

    verify(http.openUrl('DELETE', uri)).called(1);
    verify(request.close()).called(1);
  });
}

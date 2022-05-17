import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get images', () async {
    final http = mockHttpClient();
    final uri = Uri.http('localhost', '/1.0/images', {});
    final request = mockResponse(['/1.0/images/foo', '/1.0/images/bar']);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final images = await client.getImages();
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(images, equals(['foo', 'bar']));
  });

  test('get image', () async {
    const response = {
      'auto_update': true,
      'properties': {},
      'public': false,
      'expires_at': '2025-03-23T20:00:00-04:00',
      'profiles': [],
      'aliases': [],
      'architecture': 'x86_64',
      'cached': true,
      'filename':
          '06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs',
      'fingerprint':
          '06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb',
      'size': 272237676,
      'type': 'container',
      'created_at': '2021-03-23T20:00:00-04:00',
      'last_used_at': '2021-03-22T20:39:00.575185384-04:00',
      'uploaded_at': '2021-03-24T14:18:15.115036787-04:00'
    };

    final http = mockHttpClient();
    final uri = Uri.http('localhost', '/1.0/images/foo', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final image = await client.getImage('foo');
    verify(http.openUrl('GET', uri)).called(1);
    verify(request.close()).called(1);

    expect(image.architecture, equals('x86_64'));
    expect(image.autoUpdate, isTrue);
    expect(image.cached, isTrue);
    expect(
        image.createdAt, equals(DateTime.parse('2021-03-23T20:00:00-04:00')));
    expect(
        image.expiresAt, equals(DateTime.parse('2025-03-23T20:00:00-04:00')));
    expect(
        image.filename,
        equals(
            '06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs'));
    expect(
        image.fingerprint,
        equals(
            '06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb'));
    expect(image.lastUsedAt,
        equals(DateTime.parse('2021-03-22T20:39:00.575185384-04:00')));
    expect(image.profiles, equals([]));
    expect(image.public, isFalse);
    expect(image.size, equals(272237676));
    expect(image.type, equals(LxdImageType.container));
    expect(image.uploadedAt,
        equals(DateTime.parse('2021-03-24T14:18:15.115036787-04:00')));
  });
}

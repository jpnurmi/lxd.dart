import 'package:lxd/lxd.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lxd_http.dart';

void main() {
  test('get instance state', () async {
    const response = {
      'status': 'Running',
      'status_code': 0,
      'disk': {},
      'memory': {
        'usage': 89337856,
        'usage_peak': 0,
        'swap_usage': 0,
        'swap_usage_peak': 0
      },
      'network': {
        'eth0': {
          'addresses': [
            {
              'family': 'inet6',
              'address': 'fd42:4c81:5770:1eaf:216:3eff:fe0c:eedd',
              'netmask': '64',
              'scope': 'global'
            },
          ],
          'counters': {
            'bytes_received': 192021,
            'bytes_sent': 10888579,
            'packets_received': 1748,
            'packets_sent': 964,
            'errors_received': 0,
            'errors_sent': 0,
            'packets_dropped_outbound': 0,
            'packets_dropped_inbound': 0
          },
          'hwaddr': '00:16:3e:0c:ee:dd',
          'host_name': 'veth4bd95d5a',
          'mtu': 1500,
          'state': 'up',
          'type': 'broadcast'
        },
      },
      'pid': 7281,
      'processes': 46,
      'cpu': {'usage': 7123197000}
    };

    final http = mockHttpClient();
    final uri = Uri.http('localhost', '/1.0/instances/foo/state', {});
    final request = mockResponse(response);
    when(http.openUrl('GET', uri)).thenAnswer((_) async => request);

    final client = LxdClient(client: http);
    final state = await client.getInstanceState('foo');
    expect(state.network.keys, equals(['eth0']));
    final eth = state.network['eth0']!;
    expect(
        eth.addresses,
        equals([
          LxdNetworkAddress(
              address: 'fd42:4c81:5770:1eaf:216:3eff:fe0c:eedd',
              family: 'inet6',
              netmask: '64',
              scope: 'global')
        ]));
    expect(eth.counters.bytesReceived, equals(192021));
    expect(eth.counters.bytesSent, equals(10888579));
    expect(eth.counters.packetsReceived, equals(1748));
    expect(eth.counters.packetsSent, equals(964));
    expect(eth.hwaddr, equals('00:16:3e:0c:ee:dd'));
    expect(eth.mtu, equals(1500));
    expect(eth.state, equals('up'));
    expect(eth.type, equals('broadcast'));
    expect(state.pid, equals(7281));
    expect(state.status, equals('Running'));
    expect(state.statusCode, equals(0));
  });
}

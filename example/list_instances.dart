import 'package:lxd/lxd.dart';

void main() async {
  var client = LxdClient();

  var instanceNames = await client.getInstances();
  print('NAME STATE IPV4 IPV6 TYPE');
  for (var name in instanceNames) {
    var instance = await client.getInstance(name);
    var state = await client.getInstanceState(name);
    var addresses4 = <String>[];
    var addresses6 = <String>[];
    var network = state.network ?? {};
    for (var interface in network.keys) {
      if (interface == 'lo') {
        continue;
      }
      for (var address in network[interface]!.addresses) {
        if (address.scope != LxdNetworkScope.global) {
          continue;
        }
        if (address.family == LxdNetworkFamily.inet) {
          addresses4.add('${address.address} ($interface)');
        } else if (address.family == LxdNetworkFamily.inet6) {
          addresses6.add('${address.address} ($interface)');
        }
      }
    }
    print(
        '${instance.name} ${instance.status} ${addresses4.join(',')} ${addresses6.join(',')} ${instance.type}');
  }

  client.close();
}

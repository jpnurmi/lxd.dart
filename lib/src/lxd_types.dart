import 'package:collection/collection.dart';

class LxdCpuResources {
  final String architecture;
  final List<String> sockets;

  LxdCpuResources({required this.architecture, required this.sockets});

  @override
  String toString() =>
      'LxdCpuResources(architecture: $architecture, sockets: $sockets)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is LxdCpuResources &&
        other.architecture == architecture &&
        listEquals(other.sockets, sockets);
  }

  @override
  int get hashCode => Object.hash(architecture, sockets);
}

class LxdMemoryResources {
  final int used;
  final int total;

  LxdMemoryResources({required this.used, required this.total});

  @override
  String toString() => 'LxdMemoryResources(used: $used, total: $total)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdMemoryResources &&
        other.used == used &&
        other.total == total;
  }

  @override
  int get hashCode => Object.hash(used, total);
}

class LxdGpuCard {
  final String driver;
  final String driverVersion;
  final String vendor;
  final String vendorId;

  LxdGpuCard(
      {required this.driver,
      required this.driverVersion,
      required this.vendor,
      required this.vendorId});

  @override
  String toString() =>
      'LxdGpuCard(driver: $driver, driverVersion: $driverVersion, vendor: $vendor, vendorId: $vendorId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdGpuCard &&
        other.driver == driver &&
        other.driverVersion == driverVersion &&
        other.vendor == vendor &&
        other.vendorId == vendorId;
  }

  @override
  int get hashCode => Object.hash(driver, driverVersion, vendor, vendorId);
}

class LxdNetworkCard {
  final String driver;
  final String driverVersion;
  final String vendor;
  final String vendorId;

  LxdNetworkCard(
      {required this.driver,
      required this.driverVersion,
      required this.vendor,
      required this.vendorId});

  @override
  String toString() =>
      'LxdNetworkCard(driver: $driver, driverVersion: $driverVersion, vendor: $vendor, vendorId: $vendorId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdNetworkCard &&
        other.driver == driver &&
        other.driverVersion == driverVersion &&
        other.vendor == vendor &&
        other.vendorId == vendorId;
  }

  @override
  int get hashCode => Object.hash(driver, driverVersion, vendor, vendorId);
}

class LxdStorageDisk {
  final String id;
  final String model;
  final String serial;
  final int size;
  final String type;

  LxdStorageDisk(
      {required this.id,
      required this.model,
      required this.serial,
      required this.size,
      required this.type});

  @override
  String toString() =>
      'LxdStorageDisk(id: $id, model: $model, serial: $serial, size: $size, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdStorageDisk &&
        other.id == id &&
        other.model == model &&
        other.serial == serial &&
        other.size == size &&
        other.type == type;
  }

  @override
  int get hashCode => Object.hash(id, model, serial, size, type);
}

class LxdUsbDevice {
  final int busAddress;
  final int deviceAddress;
  final String product;
  final String productId;
  final double speed;
  final String vendor;
  final String vendorId;

  LxdUsbDevice(
      {required this.busAddress,
      required this.deviceAddress,
      required this.product,
      required this.productId,
      required this.speed,
      required this.vendor,
      required this.vendorId});

  @override
  String toString() =>
      'LxdUsbDevice(busAddress: $busAddress, deviceAddress: $deviceAddress, product: $product, productId: $productId, speed: $speed, vendor: $vendor, vendorId: $vendorId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdUsbDevice &&
        other.busAddress == busAddress &&
        other.deviceAddress == deviceAddress &&
        other.product == product &&
        other.productId == productId &&
        other.speed == speed &&
        other.vendor == vendor &&
        other.vendorId == vendorId;
  }

  @override
  int get hashCode {
    return Object.hash(
      busAddress,
      deviceAddress,
      product,
      productId,
      speed,
      vendor,
      vendorId,
    );
  }
}

class LxdPciDevice {
  final String driver;
  final String driverVersion;
  final String pciAddress;
  final String product;
  final String productId;
  final String vendor;
  final String vendorId;

  LxdPciDevice(
      {required this.driver,
      required this.driverVersion,
      required this.pciAddress,
      required this.product,
      required this.productId,
      required this.vendor,
      required this.vendorId});

  @override
  String toString() =>
      'LxdPciDevice(driver: $driver, driverVersion: $driverVersion, pciAddress: $pciAddress, product: $product, productId: $productId, vendor: $vendor, vendorId: $vendorId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdPciDevice &&
        other.driver == driver &&
        other.driverVersion == driverVersion &&
        other.pciAddress == pciAddress &&
        other.product == product &&
        other.productId == productId &&
        other.vendor == vendor &&
        other.vendorId == vendorId;
  }

  @override
  int get hashCode {
    return Object.hash(
      driver,
      driverVersion,
      pciAddress,
      product,
      productId,
      vendor,
      vendorId,
    );
  }
}

class LxdFirmware {
  final String date;
  final String vendor;
  final String version;

  LxdFirmware(
      {required this.date, required this.vendor, required this.version});

  @override
  String toString() =>
      'LxdFirmware(date: $date, vendor: $vendor, version: $version)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdFirmware &&
        other.date == date &&
        other.vendor == vendor &&
        other.version == version;
  }

  @override
  int get hashCode => Object.hash(date, vendor, version);
}

class LxdChassis {
  final String serial;
  final String type;
  final String vendor;
  final String version;

  LxdChassis(
      {required this.serial,
      required this.type,
      required this.vendor,
      required this.version});

  @override
  String toString() =>
      'LxdChassis(serial: $serial, type: $type, vendor: $vendor, version: $version)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdChassis &&
        other.serial == serial &&
        other.type == type &&
        other.vendor == vendor &&
        other.version == version;
  }

  @override
  int get hashCode => Object.hash(serial, type, vendor, version);
}

class LxdMotherboard {
  final String product;
  final String serial;
  final String vendor;
  final String version;

  LxdMotherboard(
      {required this.product,
      required this.serial,
      required this.vendor,
      required this.version});

  @override
  String toString() =>
      'LxdMotherboard(product: $product, serial: $serial, vendor: $vendor, version: $version)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdMotherboard &&
        other.product == product &&
        other.serial == serial &&
        other.vendor == vendor &&
        other.version == version;
  }

  @override
  int get hashCode => Object.hash(product, serial, vendor, version);
}

class LxdSystemResources {
  final String uuid;
  final String vendor;
  final String product;
  final String family;
  final String version;
  final String sku;
  final String serial;
  final String type;
  final LxdFirmware firmware;
  final LxdChassis chassis;
  final LxdMotherboard motherboard;

  LxdSystemResources(
      {required this.uuid,
      required this.vendor,
      required this.product,
      required this.family,
      required this.version,
      required this.sku,
      required this.serial,
      required this.type,
      required this.firmware,
      required this.chassis,
      required this.motherboard});

  @override
  String toString() =>
      'LxdSystemResources(uuid: $uuid, vendor: $vendor, product: $product, family: $family, version: $version, sku: $sku, serial: $serial, type: $type, firmware: $firmware, chassis: $chassis, motherboard: $motherboard)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LxdSystemResources &&
        other.uuid == uuid &&
        other.vendor == vendor &&
        other.product == product &&
        other.family == family &&
        other.version == version &&
        other.sku == sku &&
        other.serial == serial &&
        other.type == type &&
        other.firmware == firmware &&
        other.chassis == chassis &&
        other.motherboard == motherboard;
  }

  @override
  int get hashCode {
    return Object.hash(
      uuid,
      vendor,
      product,
      family,
      version,
      sku,
      serial,
      type,
      firmware,
      chassis,
      motherboard,
    );
  }
}

class LxdResources {
  final LxdCpuResources cpu;
  final LxdMemoryResources memory;
  final List<LxdGpuCard> gpuCards;
  final List<LxdNetworkCard> networkCards;
  final List<LxdStorageDisk> storageDisks;
  final List<LxdUsbDevice> usbDevices;
  final List<LxdPciDevice> pciDevices;
  final LxdSystemResources system;

  LxdResources(
      {required this.cpu,
      required this.memory,
      required this.gpuCards,
      required this.networkCards,
      required this.storageDisks,
      required this.usbDevices,
      required this.pciDevices,
      required this.system});

  @override
  String toString() =>
      'LxdResources(cpu: $cpu, memory: $memory, gpuCards: $gpuCards, networkCards: $networkCards, storageDisks: $storageDisks, usbDevices: $usbDevices, pciDevices: $pciDevices, system: $system)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is LxdResources &&
        other.cpu == cpu &&
        other.memory == memory &&
        listEquals(other.gpuCards, gpuCards) &&
        listEquals(other.networkCards, networkCards) &&
        listEquals(other.storageDisks, storageDisks) &&
        listEquals(other.usbDevices, usbDevices) &&
        listEquals(other.pciDevices, pciDevices) &&
        other.system == system;
  }

  @override
  int get hashCode {
    return Object.hash(
      cpu,
      memory,
      gpuCards,
      networkCards,
      storageDisks,
      usbDevices,
      pciDevices,
      system,
    );
  }
}

class LxdProfile {
  final Map<String, dynamic> config;
  final String description;
  final String name;

  LxdProfile(
      {required this.config, required this.description, required this.name});

  @override
  String toString() =>
      "LxdProfile(config: $config, description: '$description', name: $name)";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is LxdProfile &&
        mapEquals(other.config, config) &&
        other.description == description &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(config, description, name);
}

class LxdProject {
  final Map<String, dynamic> config;
  final String description;
  final String name;

  LxdProject(
      {required this.config, required this.description, required this.name});

  @override
  String toString() =>
      "LxdProject(config: $config, description: '$description', name: $name)";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is LxdProject &&
        mapEquals(other.config, config) &&
        other.description == description &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(config, description, name);
}

class LxdStoragePool {
  final Map<String, dynamic> config;
  final String description;
  final String name;
  final String status;

  LxdStoragePool(
      {required this.config,
      required this.description,
      required this.name,
      required this.status});

  @override
  String toString() =>
      "LxdStoragePool(config: $config, description: '$description', name: $name, status: $status)";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is LxdStoragePool &&
        mapEquals(other.config, config) &&
        other.description == description &&
        other.name == name &&
        other.status == status;
  }

  @override
  int get hashCode => Object.hash(config, description, name, status);
}

enum LxdRemoteImageType { container, virtualMachine }

class LxdRemoteImage {
  final String architecture;
  final String description;
  final Set<String> aliases;
  final String fingerprint;
  final int size;
  final LxdRemoteImageType type;
  final String url;

  LxdRemoteImage(
      {required this.architecture,
      required this.description,
      required this.aliases,
      required this.fingerprint,
      required this.size,
      required this.type,
      required this.url});

  @override
  String toString() =>
      'LxdRemoteImage(architecture: $architecture, aliases: $aliases, description: $description, fingerprint: $fingerprint, size: $size, type: $type, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final setEquals = const DeepCollectionEquality().equals;

    return other is LxdRemoteImage &&
        other.architecture == architecture &&
        other.description == description &&
        setEquals(other.aliases, aliases) &&
        other.fingerprint == fingerprint &&
        other.size == size &&
        other.type == type &&
        other.url == url;
  }

  @override
  int get hashCode {
    return Object.hash(
      architecture,
      description,
      aliases,
      fingerprint,
      size,
      type,
      url,
    );
  }
}

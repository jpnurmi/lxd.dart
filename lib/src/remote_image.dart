import 'package:collection/collection.dart';

import 'api/image.dart';

class LxdRemoteImage {
  final String architecture;
  final String description;
  final Set<String> aliases;
  final String fingerprint;
  final int size;
  final LxdImageType type;
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

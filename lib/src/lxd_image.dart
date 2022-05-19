// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lxd_image.freezed.dart';
part 'lxd_image.g.dart';

@JsonEnum(fieldRename: FieldRename.kebab)
enum LxdImageType { container, virtualMachine }

@freezed
class LxdImage with _$LxdImage {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LxdImage({
    /// Whether the image should auto-update when a new build is available
    required bool autoUpdate,

    /// Descriptive properties
    ///
    /// Example:
    /// ```json
    /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
    required Map<String, String> properties,

    /// Whether the image is available to unauthenticated users
    required bool public,

    /// When the image becomes obsolete
    required DateTime expiresAt,

    /// List of profiles to use when creating from this image (if none provided by user)
    ///
    /// Example: ["default"]
    required List<String> profiles,

    /// List of aliases
    required List<LxdImageAlias> aliases,

    /// Architecture
    /// Example: x86_64
    required String architecture,

    /// Whether the image is an automatically cached remote image
    required bool cached,

    /// Original filename
    ///
    /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs
    required String filename,

    /// Full SHA-256 fingerprint
    ///
    /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb
    required String fingerprint,

    /// Size of the image in bytes
    ///
    /// Example: 272237676
    required int size,

    /// Where the image came from
    LxdImageSource? updateSource,

    /// Type of image (container or virtual-machine)
    required LxdImageType type,

    /// When the image was originally created
    required DateTime createdAt,

    /// Last time the image was used
    required DateTime lastUsedAt,

    /// When the image was added to this LXD server
    required DateTime uploadedAt,
  }) = _LxdImage;

  factory LxdImage.fromJson(Map<String, dynamic> json) =>
      _$LxdImageFromJson(json);
}

@freezed
class LxdImageAlias with _$LxdImageAlias {
  @JsonSerializable(explicitToJson: true)
  const factory LxdImageAlias({
    /// Name of the alias
    ///
    /// Example: ubuntu-22.04
    required String name,

    /// Description of the alias
    ///
    /// Example: Our preferred Ubuntu image
    required String description,
  }) = _LxdImageAlias;

  factory LxdImageAlias.fromJson(Map<String, dynamic> json) =>
      _$LxdImageAliasFromJson(json);
}

@freezed
class LxdImageSource with _$LxdImageSource {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LxdImageSource({
    /// Source alias to download from
    ///
    /// Example: jammy
    required String alias,

    /// Source server certificate (if not trusted by system CA)
    ///
    /// Example: X509 PEM certificate
    String? certificate,

    /// Source server protocol
    ///
    /// Example: simplestreams
    required String protocol,

    /// URL of the source server
    ///
    /// Example: https://images.linuxcontainers.org
    required String server,

    // Type of image (container or virtual-machine)
    // Example: container
    //
    // API extension: image_types
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
        LxdImageType? imageType,
  }) = _LxdImageSource;

  factory LxdImageSource.fromJson(Map<String, dynamic> json) =>
      _$LxdImageSourceFromJson(json);
}

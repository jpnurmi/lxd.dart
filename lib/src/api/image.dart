// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

/// Represents an LXD image type
@JsonEnum(fieldRename: FieldRename.kebab)
enum LxdImageType { container, virtualMachine }

/// Represents an LXD image
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
    ///
    /// API extension: images_expiry
    required DateTime expiresAt,

    /// List of profiles to use when creating from this image (if none provided by user)
    ///
    /// Example: ["default"]
    ///
    /// API extension: image_profiles
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

    /// Type of image
    ///
    /// API extension: image_types
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

/// Represents an alias from the alias list of an LXD image
@freezed
class LxdImageAlias with _$LxdImageAlias {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LxdImageAlias({
    /// Name of the alias
    ///
    /// Example: ubuntu-22.04
    required String name,

    /// Description of the alias
    ///
    /// Example: Our preferred Ubuntu image
    String? description,
  }) = _LxdImageAlias;

  factory LxdImageAlias.fromJson(Map<String, dynamic> json) =>
      _$LxdImageAliasFromJson(json);
}

/// Represents the source of an LXD image
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

    /// Type of image
    ///
    /// API extension: image_types
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
        LxdImageType? imageType,
  }) = _LxdImageSource;

  factory LxdImageSource.fromJson(Map<String, dynamic> json) =>
      _$LxdImageSourceFromJson(json);
}

/// Represents LXD image metadata (used in image tarball)
@freezed
class LxdImageMetadata with _$LxdImageMetadata {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LxdImageMetadata({
    /// Architecture name
    ///
    /// Example: x86_64
    required String architecture,

    /// Image creation data (as UNIX epoch)
    ///
    /// Example: 1620655439
    required int creationDate,

    /// Image expiry data (as UNIX epoch)
    ///
    /// Example: 1620685757
    required int expiryDate,

    /// Descriptive properties
    ///
    /// Example: {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
    required Map<String, dynamic> properties,

    // Template for files in the image
    required Map<String, LxdImageMetadataTemplate> templates,
  }) = _LxdImageMetadata;

  factory LxdImageMetadata.fromJson(Map<String, dynamic> json) =>
      _$LxdImageMetadataFromJson(json);
}

/// Represents a template entry in image metadata (used in image tarball)
@freezed
class LxdImageMetadataTemplate with _$LxdImageMetadataTemplate {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LxdImageMetadataTemplate({
    /// When to trigger the template (create, copy or start)
    ///
    /// Example: create
    required List<String> when,

    // /Whether to trigger only if the file is missing
    required bool createOnly,

    /// The template itself as a valid pongo2 template
    ///
    /// Example: pongo2-template
    required String template,

    /// Key/value properties to pass to the template
    ///
    /// Example: {"foo": "bar"}
    required Map<String, dynamic> properties,
  }) = _LxdImageMetadataTemplate;

  factory LxdImageMetadataTemplate.fromJson(Map<String, dynamic> json) =>
      _$LxdImageMetadataTemplateFromJson(json);
}

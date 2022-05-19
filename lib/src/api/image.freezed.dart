// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdImage _$LxdImageFromJson(Map<String, dynamic> json) {
  return _LxdImage.fromJson(json);
}

/// @nodoc
mixin _$LxdImage {
  /// Whether the image should auto-update when a new build is available
  bool get autoUpdate => throw _privateConstructorUsedError;

  /// Descriptive properties
  ///
  /// Example:
  /// ```json
  /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  Map<String, String> get properties => throw _privateConstructorUsedError;

  /// Whether the image is available to unauthenticated users
  bool get public => throw _privateConstructorUsedError;

  /// When the image becomes obsolete
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// List of profiles to use when creating from this image (if none provided by user)
  ///
  /// Example: ["default"]
  List<String> get profiles => throw _privateConstructorUsedError;

  /// List of aliases
  List<LxdImageAlias> get aliases => throw _privateConstructorUsedError;

  /// Architecture
  /// Example: x86_64
  String get architecture => throw _privateConstructorUsedError;

  /// Whether the image is an automatically cached remote image
  bool get cached => throw _privateConstructorUsedError;

  /// Original filename
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs
  String get filename => throw _privateConstructorUsedError;

  /// Full SHA-256 fingerprint
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb
  String get fingerprint => throw _privateConstructorUsedError;

  /// Size of the image in bytes
  ///
  /// Example: 272237676
  int get size => throw _privateConstructorUsedError;

  /// Where the image came from
  LxdImageSource? get updateSource => throw _privateConstructorUsedError;

  /// Type of image (container or virtual-machine)
  LxdImageType get type => throw _privateConstructorUsedError;

  /// When the image was originally created
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last time the image was used
  DateTime get lastUsedAt => throw _privateConstructorUsedError;

  /// When the image was added to this LXD server
  DateTime get uploadedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdImageCopyWith<LxdImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdImageCopyWith<$Res> {
  factory $LxdImageCopyWith(LxdImage value, $Res Function(LxdImage) then) =
      _$LxdImageCopyWithImpl<$Res>;
  $Res call(
      {bool autoUpdate,
      Map<String, String> properties,
      bool public,
      DateTime expiresAt,
      List<String> profiles,
      List<LxdImageAlias> aliases,
      String architecture,
      bool cached,
      String filename,
      String fingerprint,
      int size,
      LxdImageSource? updateSource,
      LxdImageType type,
      DateTime createdAt,
      DateTime lastUsedAt,
      DateTime uploadedAt});

  $LxdImageSourceCopyWith<$Res>? get updateSource;
}

/// @nodoc
class _$LxdImageCopyWithImpl<$Res> implements $LxdImageCopyWith<$Res> {
  _$LxdImageCopyWithImpl(this._value, this._then);

  final LxdImage _value;
  // ignore: unused_field
  final $Res Function(LxdImage) _then;

  @override
  $Res call({
    Object? autoUpdate = freezed,
    Object? properties = freezed,
    Object? public = freezed,
    Object? expiresAt = freezed,
    Object? profiles = freezed,
    Object? aliases = freezed,
    Object? architecture = freezed,
    Object? cached = freezed,
    Object? filename = freezed,
    Object? fingerprint = freezed,
    Object? size = freezed,
    Object? updateSource = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? lastUsedAt = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(_value.copyWith(
      autoUpdate: autoUpdate == freezed
          ? _value.autoUpdate
          : autoUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: properties == freezed
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profiles: profiles == freezed
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aliases: aliases == freezed
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<LxdImageAlias>,
      architecture: architecture == freezed
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      cached: cached == freezed
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: fingerprint == freezed
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      updateSource: updateSource == freezed
          ? _value.updateSource
          : updateSource // ignore: cast_nullable_to_non_nullable
              as LxdImageSource?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdImageType,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUsedAt: lastUsedAt == freezed
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadedAt: uploadedAt == freezed
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $LxdImageSourceCopyWith<$Res>? get updateSource {
    if (_value.updateSource == null) {
      return null;
    }

    return $LxdImageSourceCopyWith<$Res>(_value.updateSource!, (value) {
      return _then(_value.copyWith(updateSource: value));
    });
  }
}

/// @nodoc
abstract class _$$_LxdImageCopyWith<$Res> implements $LxdImageCopyWith<$Res> {
  factory _$$_LxdImageCopyWith(
          _$_LxdImage value, $Res Function(_$_LxdImage) then) =
      __$$_LxdImageCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool autoUpdate,
      Map<String, String> properties,
      bool public,
      DateTime expiresAt,
      List<String> profiles,
      List<LxdImageAlias> aliases,
      String architecture,
      bool cached,
      String filename,
      String fingerprint,
      int size,
      LxdImageSource? updateSource,
      LxdImageType type,
      DateTime createdAt,
      DateTime lastUsedAt,
      DateTime uploadedAt});

  @override
  $LxdImageSourceCopyWith<$Res>? get updateSource;
}

/// @nodoc
class __$$_LxdImageCopyWithImpl<$Res> extends _$LxdImageCopyWithImpl<$Res>
    implements _$$_LxdImageCopyWith<$Res> {
  __$$_LxdImageCopyWithImpl(
      _$_LxdImage _value, $Res Function(_$_LxdImage) _then)
      : super(_value, (v) => _then(v as _$_LxdImage));

  @override
  _$_LxdImage get _value => super._value as _$_LxdImage;

  @override
  $Res call({
    Object? autoUpdate = freezed,
    Object? properties = freezed,
    Object? public = freezed,
    Object? expiresAt = freezed,
    Object? profiles = freezed,
    Object? aliases = freezed,
    Object? architecture = freezed,
    Object? cached = freezed,
    Object? filename = freezed,
    Object? fingerprint = freezed,
    Object? size = freezed,
    Object? updateSource = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? lastUsedAt = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(_$_LxdImage(
      autoUpdate: autoUpdate == freezed
          ? _value.autoUpdate
          : autoUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: properties == freezed
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profiles: profiles == freezed
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      aliases: aliases == freezed
          ? _value._aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<LxdImageAlias>,
      architecture: architecture == freezed
          ? _value.architecture
          : architecture // ignore: cast_nullable_to_non_nullable
              as String,
      cached: cached == freezed
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as bool,
      filename: filename == freezed
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: fingerprint == freezed
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      updateSource: updateSource == freezed
          ? _value.updateSource
          : updateSource // ignore: cast_nullable_to_non_nullable
              as LxdImageSource?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdImageType,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUsedAt: lastUsedAt == freezed
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadedAt: uploadedAt == freezed
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$_LxdImage implements _LxdImage {
  const _$_LxdImage(
      {required this.autoUpdate,
      required final Map<String, String> properties,
      required this.public,
      required this.expiresAt,
      required final List<String> profiles,
      required final List<LxdImageAlias> aliases,
      required this.architecture,
      required this.cached,
      required this.filename,
      required this.fingerprint,
      required this.size,
      this.updateSource,
      required this.type,
      required this.createdAt,
      required this.lastUsedAt,
      required this.uploadedAt})
      : _properties = properties,
        _profiles = profiles,
        _aliases = aliases;

  factory _$_LxdImage.fromJson(Map<String, dynamic> json) =>
      _$$_LxdImageFromJson(json);

  /// Whether the image should auto-update when a new build is available
  @override
  final bool autoUpdate;

  /// Descriptive properties
  ///
  /// Example:
  /// ```json
  /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  final Map<String, String> _properties;

  /// Descriptive properties
  ///
  /// Example:
  /// ```json
  /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  @override
  Map<String, String> get properties {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_properties);
  }

  /// Whether the image is available to unauthenticated users
  @override
  final bool public;

  /// When the image becomes obsolete
  @override
  final DateTime expiresAt;

  /// List of profiles to use when creating from this image (if none provided by user)
  ///
  /// Example: ["default"]
  final List<String> _profiles;

  /// List of profiles to use when creating from this image (if none provided by user)
  ///
  /// Example: ["default"]
  @override
  List<String> get profiles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  /// List of aliases
  final List<LxdImageAlias> _aliases;

  /// List of aliases
  @override
  List<LxdImageAlias> get aliases {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aliases);
  }

  /// Architecture
  /// Example: x86_64
  @override
  final String architecture;

  /// Whether the image is an automatically cached remote image
  @override
  final bool cached;

  /// Original filename
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs
  @override
  final String filename;

  /// Full SHA-256 fingerprint
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb
  @override
  final String fingerprint;

  /// Size of the image in bytes
  ///
  /// Example: 272237676
  @override
  final int size;

  /// Where the image came from
  @override
  final LxdImageSource? updateSource;

  /// Type of image (container or virtual-machine)
  @override
  final LxdImageType type;

  /// When the image was originally created
  @override
  final DateTime createdAt;

  /// Last time the image was used
  @override
  final DateTime lastUsedAt;

  /// When the image was added to this LXD server
  @override
  final DateTime uploadedAt;

  @override
  String toString() {
    return 'LxdImage(autoUpdate: $autoUpdate, properties: $properties, public: $public, expiresAt: $expiresAt, profiles: $profiles, aliases: $aliases, architecture: $architecture, cached: $cached, filename: $filename, fingerprint: $fingerprint, size: $size, updateSource: $updateSource, type: $type, createdAt: $createdAt, lastUsedAt: $lastUsedAt, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdImage &&
            const DeepCollectionEquality()
                .equals(other.autoUpdate, autoUpdate) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality().equals(other.public, public) &&
            const DeepCollectionEquality().equals(other.expiresAt, expiresAt) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            const DeepCollectionEquality()
                .equals(other.architecture, architecture) &&
            const DeepCollectionEquality().equals(other.cached, cached) &&
            const DeepCollectionEquality().equals(other.filename, filename) &&
            const DeepCollectionEquality()
                .equals(other.fingerprint, fingerprint) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality()
                .equals(other.updateSource, updateSource) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.lastUsedAt, lastUsedAt) &&
            const DeepCollectionEquality()
                .equals(other.uploadedAt, uploadedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(autoUpdate),
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(public),
      const DeepCollectionEquality().hash(expiresAt),
      const DeepCollectionEquality().hash(_profiles),
      const DeepCollectionEquality().hash(_aliases),
      const DeepCollectionEquality().hash(architecture),
      const DeepCollectionEquality().hash(cached),
      const DeepCollectionEquality().hash(filename),
      const DeepCollectionEquality().hash(fingerprint),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(updateSource),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(lastUsedAt),
      const DeepCollectionEquality().hash(uploadedAt));

  @JsonKey(ignore: true)
  @override
  _$$_LxdImageCopyWith<_$_LxdImage> get copyWith =>
      __$$_LxdImageCopyWithImpl<_$_LxdImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdImageToJson(this);
  }
}

abstract class _LxdImage implements LxdImage {
  const factory _LxdImage(
      {required final bool autoUpdate,
      required final Map<String, String> properties,
      required final bool public,
      required final DateTime expiresAt,
      required final List<String> profiles,
      required final List<LxdImageAlias> aliases,
      required final String architecture,
      required final bool cached,
      required final String filename,
      required final String fingerprint,
      required final int size,
      final LxdImageSource? updateSource,
      required final LxdImageType type,
      required final DateTime createdAt,
      required final DateTime lastUsedAt,
      required final DateTime uploadedAt}) = _$_LxdImage;

  factory _LxdImage.fromJson(Map<String, dynamic> json) = _$_LxdImage.fromJson;

  @override

  /// Whether the image should auto-update when a new build is available
  bool get autoUpdate => throw _privateConstructorUsedError;
  @override

  /// Descriptive properties
  ///
  /// Example:
  /// ```json
  /// {"os": "Ubuntu", "release": "jammy", "variant": "cloud"}
  Map<String, String> get properties => throw _privateConstructorUsedError;
  @override

  /// Whether the image is available to unauthenticated users
  bool get public => throw _privateConstructorUsedError;
  @override

  /// When the image becomes obsolete
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @override

  /// List of profiles to use when creating from this image (if none provided by user)
  ///
  /// Example: ["default"]
  List<String> get profiles => throw _privateConstructorUsedError;
  @override

  /// List of aliases
  List<LxdImageAlias> get aliases => throw _privateConstructorUsedError;
  @override

  /// Architecture
  /// Example: x86_64
  String get architecture => throw _privateConstructorUsedError;
  @override

  /// Whether the image is an automatically cached remote image
  bool get cached => throw _privateConstructorUsedError;
  @override

  /// Original filename
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb.rootfs
  String get filename => throw _privateConstructorUsedError;
  @override

  /// Full SHA-256 fingerprint
  ///
  /// Example: 06b86454720d36b20f94e31c6812e05ec51c1b568cf3a8abd273769d213394bb
  String get fingerprint => throw _privateConstructorUsedError;
  @override

  /// Size of the image in bytes
  ///
  /// Example: 272237676
  int get size => throw _privateConstructorUsedError;
  @override

  /// Where the image came from
  LxdImageSource? get updateSource => throw _privateConstructorUsedError;
  @override

  /// Type of image (container or virtual-machine)
  LxdImageType get type => throw _privateConstructorUsedError;
  @override

  /// When the image was originally created
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override

  /// Last time the image was used
  DateTime get lastUsedAt => throw _privateConstructorUsedError;
  @override

  /// When the image was added to this LXD server
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdImageCopyWith<_$_LxdImage> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdImageAlias _$LxdImageAliasFromJson(Map<String, dynamic> json) {
  return _LxdImageAlias.fromJson(json);
}

/// @nodoc
mixin _$LxdImageAlias {
  /// Name of the alias
  ///
  /// Example: ubuntu-22.04
  String get name => throw _privateConstructorUsedError;

  /// Description of the alias
  ///
  /// Example: Our preferred Ubuntu image
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdImageAliasCopyWith<LxdImageAlias> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdImageAliasCopyWith<$Res> {
  factory $LxdImageAliasCopyWith(
          LxdImageAlias value, $Res Function(LxdImageAlias) then) =
      _$LxdImageAliasCopyWithImpl<$Res>;
  $Res call({String name, String description});
}

/// @nodoc
class _$LxdImageAliasCopyWithImpl<$Res>
    implements $LxdImageAliasCopyWith<$Res> {
  _$LxdImageAliasCopyWithImpl(this._value, this._then);

  final LxdImageAlias _value;
  // ignore: unused_field
  final $Res Function(LxdImageAlias) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdImageAliasCopyWith<$Res>
    implements $LxdImageAliasCopyWith<$Res> {
  factory _$$_LxdImageAliasCopyWith(
          _$_LxdImageAlias value, $Res Function(_$_LxdImageAlias) then) =
      __$$_LxdImageAliasCopyWithImpl<$Res>;
  @override
  $Res call({String name, String description});
}

/// @nodoc
class __$$_LxdImageAliasCopyWithImpl<$Res>
    extends _$LxdImageAliasCopyWithImpl<$Res>
    implements _$$_LxdImageAliasCopyWith<$Res> {
  __$$_LxdImageAliasCopyWithImpl(
      _$_LxdImageAlias _value, $Res Function(_$_LxdImageAlias) _then)
      : super(_value, (v) => _then(v as _$_LxdImageAlias));

  @override
  _$_LxdImageAlias get _value => super._value as _$_LxdImageAlias;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_LxdImageAlias(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LxdImageAlias implements _LxdImageAlias {
  const _$_LxdImageAlias({required this.name, required this.description});

  factory _$_LxdImageAlias.fromJson(Map<String, dynamic> json) =>
      _$$_LxdImageAliasFromJson(json);

  /// Name of the alias
  ///
  /// Example: ubuntu-22.04
  @override
  final String name;

  /// Description of the alias
  ///
  /// Example: Our preferred Ubuntu image
  @override
  final String description;

  @override
  String toString() {
    return 'LxdImageAlias(name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdImageAlias &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_LxdImageAliasCopyWith<_$_LxdImageAlias> get copyWith =>
      __$$_LxdImageAliasCopyWithImpl<_$_LxdImageAlias>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdImageAliasToJson(this);
  }
}

abstract class _LxdImageAlias implements LxdImageAlias {
  const factory _LxdImageAlias(
      {required final String name,
      required final String description}) = _$_LxdImageAlias;

  factory _LxdImageAlias.fromJson(Map<String, dynamic> json) =
      _$_LxdImageAlias.fromJson;

  @override

  /// Name of the alias
  ///
  /// Example: ubuntu-22.04
  String get name => throw _privateConstructorUsedError;
  @override

  /// Description of the alias
  ///
  /// Example: Our preferred Ubuntu image
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdImageAliasCopyWith<_$_LxdImageAlias> get copyWith =>
      throw _privateConstructorUsedError;
}

LxdImageSource _$LxdImageSourceFromJson(Map<String, dynamic> json) {
  return _LxdImageSource.fromJson(json);
}

/// @nodoc
mixin _$LxdImageSource {
  /// Source alias to download from
  ///
  /// Example: jammy
  String get alias => throw _privateConstructorUsedError;

  /// Source server certificate (if not trusted by system CA)
  ///
  /// Example: X509 PEM certificate
  String? get certificate => throw _privateConstructorUsedError;

  /// Source server protocol
  ///
  /// Example: simplestreams
  String get protocol => throw _privateConstructorUsedError;

  /// URL of the source server
  ///
  /// Example: https://images.linuxcontainers.org
  String get server =>
      throw _privateConstructorUsedError; // Type of image (container or virtual-machine)
// Example: container
//
// API extension: image_types
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  LxdImageType? get imageType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdImageSourceCopyWith<LxdImageSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdImageSourceCopyWith<$Res> {
  factory $LxdImageSourceCopyWith(
          LxdImageSource value, $Res Function(LxdImageSource) then) =
      _$LxdImageSourceCopyWithImpl<$Res>;
  $Res call(
      {String alias,
      String? certificate,
      String protocol,
      String server,
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          LxdImageType? imageType});
}

/// @nodoc
class _$LxdImageSourceCopyWithImpl<$Res>
    implements $LxdImageSourceCopyWith<$Res> {
  _$LxdImageSourceCopyWithImpl(this._value, this._then);

  final LxdImageSource _value;
  // ignore: unused_field
  final $Res Function(LxdImageSource) _then;

  @override
  $Res call({
    Object? alias = freezed,
    Object? certificate = freezed,
    Object? protocol = freezed,
    Object? server = freezed,
    Object? imageType = freezed,
  }) {
    return _then(_value.copyWith(
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
      certificate: certificate == freezed
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as String?,
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      server: server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      imageType: imageType == freezed
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as LxdImageType?,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdImageSourceCopyWith<$Res>
    implements $LxdImageSourceCopyWith<$Res> {
  factory _$$_LxdImageSourceCopyWith(
          _$_LxdImageSource value, $Res Function(_$_LxdImageSource) then) =
      __$$_LxdImageSourceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String alias,
      String? certificate,
      String protocol,
      String server,
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          LxdImageType? imageType});
}

/// @nodoc
class __$$_LxdImageSourceCopyWithImpl<$Res>
    extends _$LxdImageSourceCopyWithImpl<$Res>
    implements _$$_LxdImageSourceCopyWith<$Res> {
  __$$_LxdImageSourceCopyWithImpl(
      _$_LxdImageSource _value, $Res Function(_$_LxdImageSource) _then)
      : super(_value, (v) => _then(v as _$_LxdImageSource));

  @override
  _$_LxdImageSource get _value => super._value as _$_LxdImageSource;

  @override
  $Res call({
    Object? alias = freezed,
    Object? certificate = freezed,
    Object? protocol = freezed,
    Object? server = freezed,
    Object? imageType = freezed,
  }) {
    return _then(_$_LxdImageSource(
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String,
      certificate: certificate == freezed
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as String?,
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      server: server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      imageType: imageType == freezed
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as LxdImageType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$_LxdImageSource implements _LxdImageSource {
  const _$_LxdImageSource(
      {required this.alias,
      this.certificate,
      required this.protocol,
      required this.server,
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          this.imageType});

  factory _$_LxdImageSource.fromJson(Map<String, dynamic> json) =>
      _$$_LxdImageSourceFromJson(json);

  /// Source alias to download from
  ///
  /// Example: jammy
  @override
  final String alias;

  /// Source server certificate (if not trusted by system CA)
  ///
  /// Example: X509 PEM certificate
  @override
  final String? certificate;

  /// Source server protocol
  ///
  /// Example: simplestreams
  @override
  final String protocol;

  /// URL of the source server
  ///
  /// Example: https://images.linuxcontainers.org
  @override
  final String server;
// Type of image (container or virtual-machine)
// Example: container
//
// API extension: image_types
  @override
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final LxdImageType? imageType;

  @override
  String toString() {
    return 'LxdImageSource(alias: $alias, certificate: $certificate, protocol: $protocol, server: $server, imageType: $imageType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdImageSource &&
            const DeepCollectionEquality().equals(other.alias, alias) &&
            const DeepCollectionEquality()
                .equals(other.certificate, certificate) &&
            const DeepCollectionEquality().equals(other.protocol, protocol) &&
            const DeepCollectionEquality().equals(other.server, server) &&
            const DeepCollectionEquality().equals(other.imageType, imageType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(alias),
      const DeepCollectionEquality().hash(certificate),
      const DeepCollectionEquality().hash(protocol),
      const DeepCollectionEquality().hash(server),
      const DeepCollectionEquality().hash(imageType));

  @JsonKey(ignore: true)
  @override
  _$$_LxdImageSourceCopyWith<_$_LxdImageSource> get copyWith =>
      __$$_LxdImageSourceCopyWithImpl<_$_LxdImageSource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdImageSourceToJson(this);
  }
}

abstract class _LxdImageSource implements LxdImageSource {
  const factory _LxdImageSource(
      {required final String alias,
      final String? certificate,
      required final String protocol,
      required final String server,
      @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final LxdImageType? imageType}) = _$_LxdImageSource;

  factory _LxdImageSource.fromJson(Map<String, dynamic> json) =
      _$_LxdImageSource.fromJson;

  @override

  /// Source alias to download from
  ///
  /// Example: jammy
  String get alias => throw _privateConstructorUsedError;
  @override

  /// Source server certificate (if not trusted by system CA)
  ///
  /// Example: X509 PEM certificate
  String? get certificate => throw _privateConstructorUsedError;
  @override

  /// Source server protocol
  ///
  /// Example: simplestreams
  String get protocol => throw _privateConstructorUsedError;
  @override

  /// URL of the source server
  ///
  /// Example: https://images.linuxcontainers.org
  String get server => throw _privateConstructorUsedError;
  @override // Type of image (container or virtual-machine)
// Example: container
//
// API extension: image_types
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  LxdImageType? get imageType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdImageSourceCopyWith<_$_LxdImageSource> get copyWith =>
      throw _privateConstructorUsedError;
}

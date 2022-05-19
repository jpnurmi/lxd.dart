// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network_acl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdNetworkAcl _$LxdNetworkAclFromJson(Map<String, dynamic> json) {
  return _LxdNetworkAcl.fromJson(json);
}

/// @nodoc
mixin _$LxdNetworkAcl {
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdNetworkAclCopyWith<LxdNetworkAcl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdNetworkAclCopyWith<$Res> {
  factory $LxdNetworkAclCopyWith(
          LxdNetworkAcl value, $Res Function(LxdNetworkAcl) then) =
      _$LxdNetworkAclCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> config, String description, String name});
}

/// @nodoc
class _$LxdNetworkAclCopyWithImpl<$Res>
    implements $LxdNetworkAclCopyWith<$Res> {
  _$LxdNetworkAclCopyWithImpl(this._value, this._then);

  final LxdNetworkAcl _value;
  // ignore: unused_field
  final $Res Function(LxdNetworkAcl) _then;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdNetworkAclCopyWith<$Res>
    implements $LxdNetworkAclCopyWith<$Res> {
  factory _$$_LxdNetworkAclCopyWith(
          _$_LxdNetworkAcl value, $Res Function(_$_LxdNetworkAcl) then) =
      __$$_LxdNetworkAclCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic> config, String description, String name});
}

/// @nodoc
class __$$_LxdNetworkAclCopyWithImpl<$Res>
    extends _$LxdNetworkAclCopyWithImpl<$Res>
    implements _$$_LxdNetworkAclCopyWith<$Res> {
  __$$_LxdNetworkAclCopyWithImpl(
      _$_LxdNetworkAcl _value, $Res Function(_$_LxdNetworkAcl) _then)
      : super(_value, (v) => _then(v as _$_LxdNetworkAcl));

  @override
  _$_LxdNetworkAcl get _value => super._value as _$_LxdNetworkAcl;

  @override
  $Res call({
    Object? config = freezed,
    Object? description = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_LxdNetworkAcl(
      config: config == freezed
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$_LxdNetworkAcl implements _LxdNetworkAcl {
  const _$_LxdNetworkAcl(
      {required final Map<String, dynamic> config,
      required this.description,
      required this.name})
      : _config = config;

  factory _$_LxdNetworkAcl.fromJson(Map<String, dynamic> json) =>
      _$$_LxdNetworkAclFromJson(json);

  final Map<String, dynamic> _config;
  @override
  Map<String, dynamic> get config {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  final String description;
  @override
  final String name;

  @override
  String toString() {
    return 'LxdNetworkAcl(config: $config, description: $description, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdNetworkAcl &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_config),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_LxdNetworkAclCopyWith<_$_LxdNetworkAcl> get copyWith =>
      __$$_LxdNetworkAclCopyWithImpl<_$_LxdNetworkAcl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdNetworkAclToJson(this);
  }
}

abstract class _LxdNetworkAcl implements LxdNetworkAcl {
  const factory _LxdNetworkAcl(
      {required final Map<String, dynamic> config,
      required final String description,
      required final String name}) = _$_LxdNetworkAcl;

  factory _LxdNetworkAcl.fromJson(Map<String, dynamic> json) =
      _$_LxdNetworkAcl.fromJson;

  @override
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdNetworkAclCopyWith<_$_LxdNetworkAcl> get copyWith =>
      throw _privateConstructorUsedError;
}

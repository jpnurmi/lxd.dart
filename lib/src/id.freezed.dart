// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LxdId {
  /// Name associated with the object
  String get name => throw _privateConstructorUsedError;

  /// Project associated with the object
  String? get project => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LxdIdCopyWith<LxdId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdIdCopyWith<$Res> {
  factory $LxdIdCopyWith(LxdId value, $Res Function(LxdId) then) =
      _$LxdIdCopyWithImpl<$Res>;
  $Res call({String name, String? project});
}

/// @nodoc
class _$LxdIdCopyWithImpl<$Res> implements $LxdIdCopyWith<$Res> {
  _$LxdIdCopyWithImpl(this._value, this._then);

  final LxdId _value;
  // ignore: unused_field
  final $Res Function(LxdId) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? project = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdIdCopyWith<$Res> implements $LxdIdCopyWith<$Res> {
  factory _$$_LxdIdCopyWith(_$_LxdId value, $Res Function(_$_LxdId) then) =
      __$$_LxdIdCopyWithImpl<$Res>;
  @override
  $Res call({String name, String? project});
}

/// @nodoc
class __$$_LxdIdCopyWithImpl<$Res> extends _$LxdIdCopyWithImpl<$Res>
    implements _$$_LxdIdCopyWith<$Res> {
  __$$_LxdIdCopyWithImpl(_$_LxdId _value, $Res Function(_$_LxdId) _then)
      : super(_value, (v) => _then(v as _$_LxdId));

  @override
  _$_LxdId get _value => super._value as _$_LxdId;

  @override
  $Res call({
    Object? name = freezed,
    Object? project = freezed,
  }) {
    return _then(_$_LxdId(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      project: project == freezed
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LxdId implements _LxdId {
  const _$_LxdId(this.name, {this.project});

  /// Name associated with the object
  @override
  final String name;

  /// Project associated with the object
  @override
  final String? project;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdId &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.project, project));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(project));

  @JsonKey(ignore: true)
  @override
  _$$_LxdIdCopyWith<_$_LxdId> get copyWith =>
      __$$_LxdIdCopyWithImpl<_$_LxdId>(this, _$identity);
}

abstract class _LxdId implements LxdId {
  const factory _LxdId(final String name, {final String? project}) = _$_LxdId;

  @override

  /// Name associated with the object
  String get name => throw _privateConstructorUsedError;
  @override

  /// Project associated with the object
  String? get project => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdIdCopyWith<_$_LxdId> get copyWith =>
      throw _privateConstructorUsedError;
}

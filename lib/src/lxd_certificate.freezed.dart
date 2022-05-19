// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lxd_certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdCertificate _$LxdCertificateFromJson(Map<String, dynamic> json) {
  return _LxdCertificate.fromJson(json);
}

/// @nodoc
mixin _$LxdCertificate {
  String get certificate => throw _privateConstructorUsedError;
  String get fingerprint => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get projects => throw _privateConstructorUsedError;
  bool get restricted => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdCertificateCopyWith<LxdCertificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdCertificateCopyWith<$Res> {
  factory $LxdCertificateCopyWith(
          LxdCertificate value, $Res Function(LxdCertificate) then) =
      _$LxdCertificateCopyWithImpl<$Res>;
  $Res call(
      {String certificate,
      String fingerprint,
      String name,
      List<String> projects,
      bool restricted,
      String type});
}

/// @nodoc
class _$LxdCertificateCopyWithImpl<$Res>
    implements $LxdCertificateCopyWith<$Res> {
  _$LxdCertificateCopyWithImpl(this._value, this._then);

  final LxdCertificate _value;
  // ignore: unused_field
  final $Res Function(LxdCertificate) _then;

  @override
  $Res call({
    Object? certificate = freezed,
    Object? fingerprint = freezed,
    Object? name = freezed,
    Object? projects = freezed,
    Object? restricted = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      certificate: certificate == freezed
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: fingerprint == freezed
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      restricted: restricted == freezed
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdCertificateCopyWith<$Res>
    implements $LxdCertificateCopyWith<$Res> {
  factory _$$_LxdCertificateCopyWith(
          _$_LxdCertificate value, $Res Function(_$_LxdCertificate) then) =
      __$$_LxdCertificateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String certificate,
      String fingerprint,
      String name,
      List<String> projects,
      bool restricted,
      String type});
}

/// @nodoc
class __$$_LxdCertificateCopyWithImpl<$Res>
    extends _$LxdCertificateCopyWithImpl<$Res>
    implements _$$_LxdCertificateCopyWith<$Res> {
  __$$_LxdCertificateCopyWithImpl(
      _$_LxdCertificate _value, $Res Function(_$_LxdCertificate) _then)
      : super(_value, (v) => _then(v as _$_LxdCertificate));

  @override
  _$_LxdCertificate get _value => super._value as _$_LxdCertificate;

  @override
  $Res call({
    Object? certificate = freezed,
    Object? fingerprint = freezed,
    Object? name = freezed,
    Object? projects = freezed,
    Object? restricted = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_LxdCertificate(
      certificate: certificate == freezed
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: fingerprint == freezed
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projects: projects == freezed
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      restricted: restricted == freezed
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_LxdCertificate implements _LxdCertificate {
  const _$_LxdCertificate(
      {required this.certificate,
      required this.fingerprint,
      required this.name,
      required final List<String> projects,
      required this.restricted,
      required this.type})
      : _projects = projects;

  factory _$_LxdCertificate.fromJson(Map<String, dynamic> json) =>
      _$$_LxdCertificateFromJson(json);

  @override
  final String certificate;
  @override
  final String fingerprint;
  @override
  final String name;
  final List<String> _projects;
  @override
  List<String> get projects {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  final bool restricted;
  @override
  final String type;

  @override
  String toString() {
    return 'LxdCertificate(certificate: $certificate, fingerprint: $fingerprint, name: $name, projects: $projects, restricted: $restricted, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdCertificate &&
            const DeepCollectionEquality()
                .equals(other.certificate, certificate) &&
            const DeepCollectionEquality()
                .equals(other.fingerprint, fingerprint) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality()
                .equals(other.restricted, restricted) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(certificate),
      const DeepCollectionEquality().hash(fingerprint),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_projects),
      const DeepCollectionEquality().hash(restricted),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_LxdCertificateCopyWith<_$_LxdCertificate> get copyWith =>
      __$$_LxdCertificateCopyWithImpl<_$_LxdCertificate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdCertificateToJson(this);
  }
}

abstract class _LxdCertificate implements LxdCertificate {
  const factory _LxdCertificate(
      {required final String certificate,
      required final String fingerprint,
      required final String name,
      required final List<String> projects,
      required final bool restricted,
      required final String type}) = _$_LxdCertificate;

  factory _LxdCertificate.fromJson(Map<String, dynamic> json) =
      _$_LxdCertificate.fromJson;

  @override
  String get certificate => throw _privateConstructorUsedError;
  @override
  String get fingerprint => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<String> get projects => throw _privateConstructorUsedError;
  @override
  bool get restricted => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdCertificateCopyWith<_$_LxdCertificate> get copyWith =>
      throw _privateConstructorUsedError;
}

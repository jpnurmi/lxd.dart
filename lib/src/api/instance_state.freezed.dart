// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'instance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdInstanceState _$LxdInstanceStateFromJson(Map<String, dynamic> json) {
  return _LxdInstanceState.fromJson(json);
}

/// @nodoc
mixin _$LxdInstanceState {
  Map<String, LxdNetworkState> get network =>
      throw _privateConstructorUsedError;
  int get pid => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdInstanceStateCopyWith<LxdInstanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdInstanceStateCopyWith<$Res> {
  factory $LxdInstanceStateCopyWith(
          LxdInstanceState value, $Res Function(LxdInstanceState) then) =
      _$LxdInstanceStateCopyWithImpl<$Res>;
  $Res call(
      {Map<String, LxdNetworkState> network,
      int pid,
      String status,
      int statusCode});
}

/// @nodoc
class _$LxdInstanceStateCopyWithImpl<$Res>
    implements $LxdInstanceStateCopyWith<$Res> {
  _$LxdInstanceStateCopyWithImpl(this._value, this._then);

  final LxdInstanceState _value;
  // ignore: unused_field
  final $Res Function(LxdInstanceState) _then;

  @override
  $Res call({
    Object? network = freezed,
    Object? pid = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdNetworkState>,
      pid: pid == freezed
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdInstanceStateCopyWith<$Res>
    implements $LxdInstanceStateCopyWith<$Res> {
  factory _$$_LxdInstanceStateCopyWith(
          _$_LxdInstanceState value, $Res Function(_$_LxdInstanceState) then) =
      __$$_LxdInstanceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, LxdNetworkState> network,
      int pid,
      String status,
      int statusCode});
}

/// @nodoc
class __$$_LxdInstanceStateCopyWithImpl<$Res>
    extends _$LxdInstanceStateCopyWithImpl<$Res>
    implements _$$_LxdInstanceStateCopyWith<$Res> {
  __$$_LxdInstanceStateCopyWithImpl(
      _$_LxdInstanceState _value, $Res Function(_$_LxdInstanceState) _then)
      : super(_value, (v) => _then(v as _$_LxdInstanceState));

  @override
  _$_LxdInstanceState get _value => super._value as _$_LxdInstanceState;

  @override
  $Res call({
    Object? network = freezed,
    Object? pid = freezed,
    Object? status = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$_LxdInstanceState(
      network: network == freezed
          ? _value._network
          : network // ignore: cast_nullable_to_non_nullable
              as Map<String, LxdNetworkState>,
      pid: pid == freezed
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$_LxdInstanceState implements _LxdInstanceState {
  const _$_LxdInstanceState(
      {required final Map<String, LxdNetworkState> network,
      required this.pid,
      required this.status,
      required this.statusCode})
      : _network = network;

  factory _$_LxdInstanceState.fromJson(Map<String, dynamic> json) =>
      _$$_LxdInstanceStateFromJson(json);

  final Map<String, LxdNetworkState> _network;
  @override
  Map<String, LxdNetworkState> get network {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_network);
  }

  @override
  final int pid;
  @override
  final String status;
  @override
  final int statusCode;

  @override
  String toString() {
    return 'LxdInstanceState(network: $network, pid: $pid, status: $status, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdInstanceState &&
            const DeepCollectionEquality().equals(other._network, _network) &&
            const DeepCollectionEquality().equals(other.pid, pid) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_network),
      const DeepCollectionEquality().hash(pid),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(statusCode));

  @JsonKey(ignore: true)
  @override
  _$$_LxdInstanceStateCopyWith<_$_LxdInstanceState> get copyWith =>
      __$$_LxdInstanceStateCopyWithImpl<_$_LxdInstanceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdInstanceStateToJson(this);
  }
}

abstract class _LxdInstanceState implements LxdInstanceState {
  const factory _LxdInstanceState(
      {required final Map<String, LxdNetworkState> network,
      required final int pid,
      required final String status,
      required final int statusCode}) = _$_LxdInstanceState;

  factory _LxdInstanceState.fromJson(Map<String, dynamic> json) =
      _$_LxdInstanceState.fromJson;

  @override
  Map<String, LxdNetworkState> get network =>
      throw _privateConstructorUsedError;
  @override
  int get pid => throw _privateConstructorUsedError;
  @override
  String get status => throw _privateConstructorUsedError;
  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdInstanceStateCopyWith<_$_LxdInstanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

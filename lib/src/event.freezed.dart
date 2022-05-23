// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LxdEvent _$LxdEventFromJson(Map<String, dynamic> json) {
  return _LxdEvent.fromJson(json);
}

/// @nodoc
mixin _$LxdEvent {
  LxdEventType get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LxdEventCopyWith<LxdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LxdEventCopyWith<$Res> {
  factory $LxdEventCopyWith(LxdEvent value, $Res Function(LxdEvent) then) =
      _$LxdEventCopyWithImpl<$Res>;
  $Res call(
      {LxdEventType type,
      DateTime timestamp,
      Map<String, dynamic>? metadata,
      String? location});
}

/// @nodoc
class _$LxdEventCopyWithImpl<$Res> implements $LxdEventCopyWith<$Res> {
  _$LxdEventCopyWithImpl(this._value, this._then);

  final LxdEvent _value;
  // ignore: unused_field
  final $Res Function(LxdEvent) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? timestamp = freezed,
    Object? metadata = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdEventType,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LxdEventCopyWith<$Res> implements $LxdEventCopyWith<$Res> {
  factory _$$_LxdEventCopyWith(
          _$_LxdEvent value, $Res Function(_$_LxdEvent) then) =
      __$$_LxdEventCopyWithImpl<$Res>;
  @override
  $Res call(
      {LxdEventType type,
      DateTime timestamp,
      Map<String, dynamic>? metadata,
      String? location});
}

/// @nodoc
class __$$_LxdEventCopyWithImpl<$Res> extends _$LxdEventCopyWithImpl<$Res>
    implements _$$_LxdEventCopyWith<$Res> {
  __$$_LxdEventCopyWithImpl(
      _$_LxdEvent _value, $Res Function(_$_LxdEvent) _then)
      : super(_value, (v) => _then(v as _$_LxdEvent));

  @override
  _$_LxdEvent get _value => super._value as _$_LxdEvent;

  @override
  $Res call({
    Object? type = freezed,
    Object? timestamp = freezed,
    Object? metadata = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_LxdEvent(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LxdEventType,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: metadata == freezed
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_LxdEvent implements _LxdEvent {
  const _$_LxdEvent(
      {required this.type,
      required this.timestamp,
      final Map<String, dynamic>? metadata,
      this.location})
      : _metadata = metadata;

  factory _$_LxdEvent.fromJson(Map<String, dynamic> json) =>
      _$$_LxdEventFromJson(json);

  @override
  final LxdEventType type;
  @override
  final DateTime timestamp;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? location;

  @override
  String toString() {
    return 'LxdEvent(type: $type, timestamp: $timestamp, metadata: $metadata, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LxdEvent &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(_metadata),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_LxdEventCopyWith<_$_LxdEvent> get copyWith =>
      __$$_LxdEventCopyWithImpl<_$_LxdEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LxdEventToJson(this);
  }
}

abstract class _LxdEvent implements LxdEvent {
  const factory _LxdEvent(
      {required final LxdEventType type,
      required final DateTime timestamp,
      final Map<String, dynamic>? metadata,
      final String? location}) = _$_LxdEvent;

  factory _LxdEvent.fromJson(Map<String, dynamic> json) = _$_LxdEvent.fromJson;

  @override
  LxdEventType get type => throw _privateConstructorUsedError;
  @override
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @override
  String? get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LxdEventCopyWith<_$_LxdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

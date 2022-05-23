// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdEvent _$$_LxdEventFromJson(Map<String, dynamic> json) => _$_LxdEvent(
      type: $enumDecode(_$LxdEventTypeEnumMap, json['type']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$_LxdEventToJson(_$_LxdEvent instance) =>
    <String, dynamic>{
      'type': _$LxdEventTypeEnumMap[instance.type],
      'timestamp': instance.timestamp.toIso8601String(),
      'metadata': instance.metadata,
      'location': instance.location,
    };

const _$LxdEventTypeEnumMap = {
  LxdEventType.logging: 'logging',
  LxdEventType.operation: 'operation',
  LxdEventType.lifecycle: 'lifecycle',
};

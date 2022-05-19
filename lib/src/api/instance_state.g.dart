// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdInstanceState _$$_LxdInstanceStateFromJson(Map<String, dynamic> json) =>
    _$_LxdInstanceState(
      network: (json['network'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LxdNetworkState.fromJson(e as Map<String, dynamic>)),
      ),
      pid: json['pid'] as int,
      status: json['status'] as String,
      statusCode: json['status_code'] as int,
    );

Map<String, dynamic> _$$_LxdInstanceStateToJson(_$_LxdInstanceState instance) =>
    <String, dynamic>{
      'network': instance.network.map((k, e) => MapEntry(k, e.toJson())),
      'pid': instance.pid,
      'status': instance.status,
      'status_code': instance.statusCode,
    };

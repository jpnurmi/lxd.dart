// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_pool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdStoragePool _$$_LxdStoragePoolFromJson(Map<String, dynamic> json) =>
    _$_LxdStoragePool(
      config: json['config'] as Map<String, dynamic>,
      description: json['description'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_LxdStoragePoolToJson(_$_LxdStoragePool instance) =>
    <String, dynamic>{
      'config': instance.config,
      'description': instance.description,
      'name': instance.name,
      'status': instance.status,
    };

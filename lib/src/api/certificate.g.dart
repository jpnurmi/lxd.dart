// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LxdCertificate _$$_LxdCertificateFromJson(Map<String, dynamic> json) =>
    _$_LxdCertificate(
      certificate: json['certificate'] as String,
      fingerprint: json['fingerprint'] as String,
      name: json['name'] as String,
      projects:
          (json['projects'] as List<dynamic>).map((e) => e as String).toList(),
      restricted: json['restricted'] as bool,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_LxdCertificateToJson(_$_LxdCertificate instance) =>
    <String, dynamic>{
      'certificate': instance.certificate,
      'fingerprint': instance.fingerprint,
      'name': instance.name,
      'projects': instance.projects,
      'restricted': instance.restricted,
      'type': instance.type,
    };

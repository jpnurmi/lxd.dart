// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lxd_certificate.freezed.dart';
part 'lxd_certificate.g.dart';

@freezed
class LxdCertificate with _$LxdCertificate {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LxdCertificate({
    required String certificate,
    required String fingerprint,
    required String name,
    required List<String> projects,
    required bool restricted,
    required String type,
  }) = _LxdCertificate;

  factory LxdCertificate.fromJson(Map<String, dynamic> json) =>
      _$LxdCertificateFromJson(json);
}

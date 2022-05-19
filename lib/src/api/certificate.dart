// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate.freezed.dart';
part 'certificate.g.dart';

enum LxdCertificateType { client, server, metrics, unknown }

@freezed
class LxdCertificate with _$LxdCertificate {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LxdCertificate({
    /// Name associated with the certificate
    ///
    /// Example: castiana
    required String name,

    /// Usage type for the certificate
    @JsonKey(unknownEnumValue: LxdCertificateType.unknown)
        required LxdCertificateType type,

    // Whether to limit the certificate to listed projects
    required bool restricted,

    /// List of allowed projects (applies when restricted)
    ///
    /// Example: ["default", "foo", "bar"]
    required List<String> projects,

    /// The certificate itself, as PEM encoded X509
    ///
    /// Example: X509 PEM certificate
    required String certificate,

    /// SHA256 fingerprint of the certificate
    ///
    /// Example: fd200419b271f1dc2a5591b693cc5774b7f234e1ff8c6b78ad703b6888fe2b69
    required String fingerprint,
  }) = _LxdCertificate;

  factory LxdCertificate.fromJson(Map<String, dynamic> json) =>
      _$LxdCertificateFromJson(json);
}

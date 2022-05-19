// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_acl.freezed.dart';
part 'network_acl.g.dart';

@freezed
class LxdNetworkAcl with _$LxdNetworkAcl {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LxdNetworkAcl({
    required Map<String, dynamic> config,
    required String description,
    required String name,
  }) = _LxdNetworkAcl;

  factory LxdNetworkAcl.fromJson(Map<String, dynamic> json) =>
      _$LxdNetworkAclFromJson(json);
}

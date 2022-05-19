// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class LxdProfile with _$LxdProfile {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LxdProfile({
    required Map<String, dynamic> config,
    required String description,
    required String name,
  }) = _LxdProfile;

  factory LxdProfile.fromJson(Map<String, dynamic> json) =>
      _$LxdProfileFromJson(json);
}

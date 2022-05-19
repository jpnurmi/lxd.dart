// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'network.dart';

part 'instance_state.freezed.dart';
part 'instance_state.g.dart';

@freezed
class LxdInstanceState with _$LxdInstanceState {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory LxdInstanceState({
    required Map<String, LxdNetworkState> network,
    required int pid,
    required String status,
    required int statusCode,
  }) = _LxdInstanceState;

  factory LxdInstanceState.fromJson(Map<String, dynamic> json) =>
      _$LxdInstanceStateFromJson(json);
}

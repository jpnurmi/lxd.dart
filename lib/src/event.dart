// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

enum LxdEventType {
  logging,
  operation,
  lifecycle,
}

@freezed
class LxdEvent with _$LxdEvent {
  @JsonSerializable()
  const factory LxdEvent({
    required LxdEventType type,
    required DateTime timestamp,
    Map<String, dynamic>? metadata,
    String? location,
  }) = _LxdEvent;

  factory LxdEvent.fromJson(Map<String, dynamic> json) =>
      _$LxdEventFromJson(json);
}

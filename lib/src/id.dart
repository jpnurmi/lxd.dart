import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'api/instance.dart';

part 'id.freezed.dart';

/// Identifies an LXD object
@freezed
class LxdId with _$LxdId {
  const factory LxdId(
    /// Name associated with the object
    String name, {

    /// Project associated with the object
    String? project,
  }) = _LxdId;

  factory LxdId.fromString(String id) {
    final uri = Uri.tryParse(id);
    return LxdId(
      uri?.pathSegments.lastOrNull ?? id.split('/').last,
      project: uri?.queryParameters['project'],
    );
  }

  @override
  String toString() {
    return Uri(
      path: name,
      queryParameters: {if (project != null) 'project': project},
    ).toString();
  }
}

extension LxdInstanceId on LxdInstance {
  LxdId get id => LxdId(name, project: project);
}

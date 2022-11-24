import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import 'api/instance.dart';

/// Identifies an LXD object
@immutable
class LxdId {
  const LxdId(this.name, {this.project});

  /// Name associated with the object
  final String name;

  /// Project associated with the object
  final String? project;

  factory LxdId.fromString(String id) {
    final uri = Uri.tryParse(id);
    return LxdId(
      uri?.pathSegments.lastOrNull ?? id.split('/').last,
      project: uri?.queryParameters['project'],
    );
  }

  @override
  int get hashCode => Object.hash(name, project);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LxdId && other.name == name && other.project == project;
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

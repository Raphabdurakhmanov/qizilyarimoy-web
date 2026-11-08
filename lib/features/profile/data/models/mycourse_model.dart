import 'package:app/features/profile/domain/entities/mycourse_entity.dart';

class MyCourseModel extends MyCourseEntity {
  const MyCourseModel({
    required super.userUsername,
    required super.course,
    required super.courseTitle,
    required super.completedTasks,
    required super.totalTasks,
    required super.progress,
    required super.progressDisplay,
  });
  factory MyCourseModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return MyCourseModel(
      userUsername: json['user_username'] as String?,
      course: json['course_id'] as int?,
      courseTitle: json['title'] as String?,
      completedTasks: json['completed_lessons'] as int?,
      totalTasks: json['total_lessons'] as int?,
      progress: (json['progress_percent'] as num?)?.toDouble(),
      progressDisplay: json['progress_display'] as String? ?? '',
    );
  }
}

import 'package:equatable/equatable.dart';

class MyCourseEntity extends Equatable {
  final String? userUsername;
  final int? course;
  final String? courseTitle;
  final int? completedTasks;
  final int? totalTasks;
  final double? progress;
  final String progressDisplay;

  const MyCourseEntity({
    required this.userUsername,
    required this.course,
    required this.courseTitle,
    required this.completedTasks,
    required this.totalTasks,
    required this.progress,
    required this.progressDisplay,
  });

  @override
  List<Object?> get props => [
    userUsername,
    course,
    courseTitle,
    completedTasks,
    totalTasks,
    progress,
    progressDisplay,
  ];
}

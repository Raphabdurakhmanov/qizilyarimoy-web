import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class PaginatedCourseEntity extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<CourseEntity>? results;

  const PaginatedCourseEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}

class CourseEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final int? category;
  final String? status;
  final double? rating;
  final int? studentsCount;
  final int? activeStudents;
  final int? inactiveStudents;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? level;
  final String? language;
  final bool isEnrolled;
  final ValueNotifier<LessonEntity?> activeLesson;
  final bool isCourseCompleted;

  const CourseEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.category,
    this.status,
    this.rating,
    this.studentsCount,
    this.activeStudents,
    this.inactiveStudents,
    this.createdAt,
    this.updatedAt,
    this.level,
    this.language,
    this.isEnrolled = false,
    required this.activeLesson,
    this.isCourseCompleted = false,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    image,
    category,
    status,
    rating,
    studentsCount,
    activeStudents,
    inactiveStudents,
    createdAt,
    updatedAt,
    level,
    language,
    isEnrolled,
    activeLesson,
    isCourseCompleted,
  ];
}

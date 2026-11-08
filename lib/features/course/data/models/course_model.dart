import 'package:app/features/course/data/models/lesson_model.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:flutter/material.dart' show ValueNotifier;

class PaginatedCourseModel extends PaginatedCourseEntity {
  const PaginatedCourseModel({
    super.count,
    super.next,
    super.previous,
    super.results,
  });

  factory PaginatedCourseModel.fromJson(Map<String, dynamic> json) {
    return PaginatedCourseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          json['results'] != null
              ? (json['results'] as List)
                  .map((item) => CourseModel.fromJson(item))
                  .toList()
              : [],
    );
  }

  PaginatedCourseEntity toEntity() {
    return PaginatedCourseEntity(
      count: count,
      next: next,
      previous: previous,
      results: results,
    );
  }
}

class CourseModel extends CourseEntity {
  const CourseModel({
    super.id,
    super.title,
    super.description,
    super.image,
    super.category,
    super.status,
    super.rating,
    super.studentsCount,
    super.activeStudents,
    super.inactiveStudents,
    super.createdAt,
    super.updatedAt,
    super.level,
    super.language,
    super.isEnrolled,
    required super.activeLesson,
    super.isCourseCompleted,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      status: json['status'],
      rating: (json['rating'] as num?)?.toDouble(),
      studentsCount: json['students_count'],
      activeStudents: json['active_students'],
      inactiveStudents: json['inactive_students'],
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
      level: json['level'],
      language: json['language'],
      isEnrolled: json['is_enrolled'] ?? false,
      isCourseCompleted: json['is_course_completed'] ?? false,
      activeLesson: ValueNotifier<LessonEntity?>(
        json['active_lesson'] != null
            ? LessonModel.fromJson(json['active_lesson'])
            : null,
      ),
    );
  }

  CourseEntity toEntity() {
    return CourseEntity(
      activeStudents: activeStudents,
      category: category,
      createdAt: createdAt,
      description: description,
      id: id,
      image: image,
      inactiveStudents: inactiveStudents,
      language: language,
      level: level,
      rating: rating,
      status: status,
      studentsCount: studentsCount,
      title: title,
      updatedAt: updatedAt,
      activeLesson: activeLesson,
      isEnrolled: isEnrolled,
      isCourseCompleted: isCourseCompleted,
    );
  }
}

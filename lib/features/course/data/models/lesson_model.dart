import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:flutter/material.dart';

class PaginatedLessonModel extends PaginatedLessonEntity {
  const PaginatedLessonModel({
    super.count,
    super.next,
    super.previous,
    super.results,
  });

  factory PaginatedLessonModel.fromJson(Map<String, dynamic> json) {
    return PaginatedLessonModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List?)
              ?.map((item) => LessonModel.fromJson(item))
              .toList(),
    );
  }

  PaginatedLessonEntity toEntity() {
    return PaginatedLessonEntity(
      count: count,
      next: next,
      previous: previous,
      results: results?.map((lesson) => lesson).toList(),
    );
  }
}

class LessonModel extends LessonEntity {
  const LessonModel({
    super.id,
    super.title,
    super.videoUrl,
    super.description,
    super.file,
    super.order,
    super.duration,
    super.moduleTitle,
    super.canAccess,
    super.courseTitle,
    super.imageFile,
    super.imageUrl,
    super.videoStream,
    required super.isCompleted,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      title: json['title'],
      videoUrl: json['video_url'],
      description: json['description'],
      file: json['file'],
      order: json['order'],
      duration: json['duration'],
      isCompleted: ValueNotifier(json['is_completed'] ?? false),
      moduleTitle: json['module_title'],
      courseTitle: json['course_title'],
      imageUrl: json['image_url'],
      videoStream: json['video_stream'],
      imageFile: json['image_file'],
      canAccess: json['can_access'] ?? true,
    );
  }

  LessonEntity toEntity() {
    return LessonEntity(
      description: description,
      file: file,
      id: id,
      order: order,
      title: title,
      videoUrl: videoUrl,
      isCompleted: isCompleted,
      duration: duration,
      moduleTitle: moduleTitle,
      courseTitle: courseTitle,
      canAccess: canAccess,
      imageUrl: imageUrl,
      videoStream: videoStream,
      imageFile: imageFile,
    );
  }
}

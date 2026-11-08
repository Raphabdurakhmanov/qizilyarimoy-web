// Lesson Entity
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class PaginatedLessonEntity extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<LessonEntity>? results;

  const PaginatedLessonEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}

class LessonEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? file;
  final int? order;
  final String? duration;
  final ValueNotifier<bool> isCompleted;
  final bool canAccess;
  final String? moduleTitle;
  final String? courseTitle;
  // Additional fields for video and image URLs
  final String? videoUrl;
  final String? imageUrl;
  // Optional fields for video stream and image file
  final String? videoStream;
  final String? imageFile;

  const LessonEntity({
    this.id,
    this.title,
    this.videoUrl,
    this.description,
    this.file,
    this.order,
    this.duration,
    required this.isCompleted,
    this.moduleTitle,
    this.courseTitle,
    this.canAccess = true,
    this.imageUrl,
    this.videoStream,
    this.imageFile,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    file,
    order,
    isCompleted,
    moduleTitle,
    courseTitle,
    canAccess,
    imageUrl,
    videoStream,
    imageFile,
    videoUrl,
  ];
}

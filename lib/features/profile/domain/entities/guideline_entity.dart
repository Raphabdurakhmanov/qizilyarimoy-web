import 'package:equatable/equatable.dart';

class PaginatedGuidelineEntity extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<GuidelineEntity> results;

  const PaginatedGuidelineEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}

class GuidelineEntity extends Equatable {
  final int id;
  final String title;
  final String? image;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  const GuidelineEntity({
    required this.id,
    required this.title,
    this.image,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, title, image, content, createdAt, updatedAt];
}
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:equatable/equatable.dart';

// Paginated Entity for Modules
class PaginatedModuleEntity extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<ModuleEntity>? results;

  const PaginatedModuleEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}

// Module Entity
class ModuleEntity extends Equatable {
  final int? id;
  final String? title;
  final int? order;
  final List<LessonEntity>? lessons;

  const ModuleEntity({this.id, this.title, this.order, this.lessons});

  @override
  List<Object?> get props => [id, title, order, lessons];
}

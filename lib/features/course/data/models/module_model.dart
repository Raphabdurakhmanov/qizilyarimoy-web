import 'package:app/features/course/data/models/lesson_model.dart';
import 'package:app/features/course/domain/entities/module_entity.dart';

// Paginated Model for Modules
class PaginatedModuleModel extends PaginatedModuleEntity {
  const PaginatedModuleModel({
    super.count,
    super.next,
    super.previous,
    super.results,
  });

  factory PaginatedModuleModel.fromJson(Map<String, dynamic> json) {
    return PaginatedModuleModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          json['results'] != null
              ? (json['results'] as List)
                  .map((item) => ModuleModel.fromJson(item))
                  .toList()
              : null,
    );
  }
  PaginatedModuleEntity toEntity() {
    return PaginatedModuleEntity(
      count: count,
      next: next,
      previous: previous,
      results: results?.map((module) => module).toList(),
    );
  }
}

// Module Model
class ModuleModel extends ModuleEntity {
  const ModuleModel({super.id, super.title, super.order, super.lessons});

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'],
      title: json['title'],
      order: json['order'],
      lessons:
          json['lessons'] != null
              ? (json['lessons'] as List)
                  .map((item) => LessonModel.fromJson(item))
                  .toList()
              : null,
    );
  }

  ModuleEntity toEntity() {
    return ModuleEntity(
      id: id,
      title: title,
      order: order,
      lessons: lessons?.map((lesson) => lesson).toList(),
    );
  }
}

import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/module_entity.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';

class ModulesUsecase {
  final CourseRepository repository;

  ModulesUsecase(this.repository);

  Future<Either<Failure, PaginatedModuleEntity>> call({
    required int id,
    String? url,
  }) async {
    return repository.getCourseModules(id);
  }
}

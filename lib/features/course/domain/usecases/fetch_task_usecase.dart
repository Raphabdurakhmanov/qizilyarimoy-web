import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/task_entity.dart';
import 'package:app/features/course/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart';

class FetchTaskUseCase {
  final TaskRepository repository;

  FetchTaskUseCase(this.repository);

  Future<Either<Failure, List<TaskEntity>>> call(int id) {
    return repository.fetchTasks(id);
  }
}

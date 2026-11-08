import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> fetchTasks(int id);
}

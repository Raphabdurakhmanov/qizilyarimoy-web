import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/entities/mycourse_entity.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class MyCoursesUsecase {
  UserRepository repository;

  MyCoursesUsecase(this.repository);

  Future<Either<Failure, List<MyCourseEntity>>> call() async {
    return repository.getMyCourses();
  }
}

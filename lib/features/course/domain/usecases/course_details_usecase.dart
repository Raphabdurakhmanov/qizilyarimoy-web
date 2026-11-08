import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';

class CourseDetailsUsecase {
  CourseRepository repository;

  CourseDetailsUsecase(this.repository);

  Future<Either<Failure, CourseEntity>> call(int courseId) async {
    return repository.getCourseDetails(courseId);
  }
}

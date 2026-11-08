import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';

class EnrollCourseUseCase {
  final CourseRepository repository;

  EnrollCourseUseCase(this.repository);

  Future<Either<Failure, LessonEntity>> call(int courseId) {
    return repository.enrollCourse(courseId);
  }
}

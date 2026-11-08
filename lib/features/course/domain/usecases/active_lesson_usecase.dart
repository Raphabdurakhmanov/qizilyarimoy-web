import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';

class ActiveLessonUsecase {
  final CourseRepository _courseRepository;

  ActiveLessonUsecase(this._courseRepository);

  Future<Either<Failure, LessonEntity>> call(int courseId) {
    return _courseRepository.getActiveLesson(courseId);
  }
}

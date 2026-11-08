import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';

class NextLessonUsecase {
  final CourseRepository _courseRepository;

  NextLessonUsecase(this._courseRepository);

  Future<Either<Failure, LessonEntity>> call(int courseId, int lessonId) {
    return _courseRepository.nextLesson(courseId, lessonId);
  }
}

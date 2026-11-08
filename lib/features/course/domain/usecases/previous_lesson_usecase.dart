import 'package:app/core/error/failure.dart';

import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';

class PreviousLessonUsecase {
  final CourseRepository courseRepository;
  PreviousLessonUsecase(this.courseRepository);
  Future<Either<Failure, LessonEntity>> call(int courseId, int lessonId) async {
    return courseRepository.previousLesson(courseId, lessonId);
  }
}

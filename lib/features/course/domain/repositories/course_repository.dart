import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/entities/module_entity.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CourseRepository {
  Future<Either<Failure, PaginatedCourseEntity>> getCourses({
    String? url,
    String? order,
    String? search,
  });
  Future<Either<Failure, CourseEntity>> getCourseDetails(int courseId);
  Future<Either<Failure, PaginatedModuleEntity>> getCourseModules(
    int courseId, {
    String? url,
  });

  Future<Either<Failure, LessonEntity>> enrollCourse(int courseId);
  Future<Either<Failure, LessonEntity>> getActiveLesson(int courseId);
  Future<Either<Failure, LessonEntity>> previousLesson(
    int courseId,
    int lessonId,
  );
  Future<Either<Failure, LessonEntity>> nextLesson(int courseId, int lessonId);
  Future<Either<Failure, List<CommentEntity>>> fetchComments(
    int courseId, {
    String? url,
  });
  Future<Either<Failure, List<CommentEntity>>> likeToCourseComment(
    int commentId,
  );
  Future<Either<Failure, dynamic>> sendComment({
    required int courseId,
    required String text,
    int? parent,
  });
  Future<Either<Failure, dynamic>> rateCourse(int courseId, int rating);
}

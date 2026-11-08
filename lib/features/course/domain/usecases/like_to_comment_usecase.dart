import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:dartz/dartz.dart';

class LikeToCommentUsecase {
  CourseRepository repository;

  LikeToCommentUsecase(this.repository);

  Future<Either<Failure, List<CommentEntity>>> call(
    int courseId, {
    String? url,
  }) async {
    return repository.likeToCourseComment(courseId);
  }
}

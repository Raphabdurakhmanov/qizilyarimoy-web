import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:dartz/dartz.dart';

class SendCommentUsecase {
  CourseRepository repository;

  SendCommentUsecase(this.repository);

  Future<Either<Failure, dynamic>> call({
    required int courseId,
    required String text,
    int? parent,
  }) async {
    return repository.sendComment(
      courseId: courseId,
      text: text,
      parent: parent,
    );
  }
}

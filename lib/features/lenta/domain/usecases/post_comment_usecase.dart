import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class PostCommentUseCase {
  final NewsRepository repository;

  PostCommentUseCase(this.repository);

  Future<Either<Failure, CommentEntity>> call({
    required int id,
    required String comment,
    int? parentId,
  }) async {
    return await repository.postComment(
      id: id,
      comment: comment,
      commentId: parentId,
    );
  }
}

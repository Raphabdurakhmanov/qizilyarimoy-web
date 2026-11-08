import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class CommentsUseCase {
  final NewsRepository repository;

  CommentsUseCase(this.repository);

  Future<Either<Failure, List<CommentEntity>>> call({
    required int postId,
  }) async {
    return await repository.allComments(id: postId);
  }
}

import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class LikeCommentUsecase {
  final NewsRepository repository;

  LikeCommentUsecase(this.repository);

  Future<Either<Failure, void>> call({required int commentId}) async {
    return await repository.likeToComment(id: commentId);
  }
}

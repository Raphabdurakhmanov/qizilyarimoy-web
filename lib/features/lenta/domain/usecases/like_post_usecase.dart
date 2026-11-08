import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class LikePostUsecase {
  final NewsRepository repository;

  LikePostUsecase(this.repository);

  Future<Either<Failure, void>> call({required int postId}) async {
    return await repository.likeToPost(id: postId);
  }
}

import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class ViewsPostUsecase {
  final NewsRepository repository;

  ViewsPostUsecase(this.repository);

  Future<Either<Failure, void>> call({required int postId}) async {
    return await repository.viewToPost(id: postId);
  }
}

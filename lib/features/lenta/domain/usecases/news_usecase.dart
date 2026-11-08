import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/domain/entities/news_entity.dart';
import 'package:app/features/lenta/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class GetNewsUsecase {
  final NewsRepository repository;

  GetNewsUsecase(this.repository);

  Future<Either<Failure, PaginatedNewsEntity>> call({String? page}) async {
    return await repository.getNews(page: page);
  }
}

import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/domain/entities/news_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, PaginatedNewsEntity>> getNews({String? page});
  Future<Either<Failure, dynamic>> likeToPost({required int id});
  Future<Either<Failure, dynamic>> likeToComment({required int id});
  Future<Either<Failure, dynamic>> viewToPost({required int id});
  Future<Either<Failure, List<CommentEntity>>> allComments({required int id});
  Future<Either<Failure, CommentEntity>> postComment({
    required int id,
    required String comment,
    int? commentId,
  });
}

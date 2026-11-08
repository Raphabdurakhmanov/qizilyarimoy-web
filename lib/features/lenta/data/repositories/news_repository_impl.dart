import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/lenta/data/data_sources/news_remote_data_source.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/domain/entities/news_entity.dart';
import 'package:app/features/lenta/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource dataSource;
  NetworkInfo networkInfo;

  NewsRepositoryImpl({required this.dataSource, required this.networkInfo});
  @override
  Future<Either<Failure, PaginatedNewsEntity>> getNews({String? page}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.fetchNews(page: page);
        return Right(res.toEntity());
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> allComments({
    required int id,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final res = dataSource.allComments(id: id);
        return res.then(
          (comments) => Right(comments.map((e) => e.toEntity()).toList()),
        );
      } on Failure catch (failure) {
        return Future.value(Left(failure));
      } catch (e) {
        return Future.value(Left(UnknownFailure(e.toString())));
      }
    } else {
      return Future.value(Left(NetworkFailure("no_internet_connection".tr())));
    }
  }

  @override
  Future<Either<Failure, dynamic>> likeToPost({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.likeToPost(id: id);
        return Right(res);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, CommentEntity>> postComment({
    required int id,
    required String comment,
    int? commentId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.postComment(
          id: id,
          comment: comment,
          commentId: commentId,
        );
        return Right(res.toEntity());
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> viewToPost({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.viewToPost(id: id);
        return Right(res);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> likeToComment({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.likeToComment(id: id);
        return Right(res);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }
}

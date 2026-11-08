import 'package:app/config/api_constants.dart';
import 'package:app/config/constants.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/lenta/data/models/comment_model.dart';
import 'package:app/features/lenta/data/models/news_model.dart';
import 'package:dio/dio.dart';

abstract class NewsRemoteDataSource {
  Future<PaginatedNewsModel> fetchNews({String? page});
  Future<dynamic> likeToPost({required int id});
  Future<dynamic> likeToComment({required int id});
  Future<dynamic> viewToPost({required int id});
  Future<List<CommentModel>> allComments({required int id});
  Future<CommentModel> postComment({
    required int id,
    required String comment,
    int? commentId,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiClient client;
  NewsRemoteDataSourceImpl({required this.client});

  @override
  Future<PaginatedNewsModel> fetchNews({String? page}) async {
    try {
      final res = await client.getRequest(
        page ?? ApiConstants.news(),
        headers: {'Authorization': "Bearer $accessToken"},
      );
      return PaginatedNewsModel.fromJson(res);
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CommentModel>> allComments({required int id}) async {
    try {
      final res = await client.getRequest(
        ApiConstants.comments(id),
        headers: {'Authorization': "Bearer $accessToken"},
      );
      final comments =
          (res as List<dynamic>)
              .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList();
      return comments;
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future likeToPost({required int id}) async {
    try {
      final res = await client.postRequest(
        ApiConstants.likeToNews(id),
        headers: {'Authorization': "Bearer $accessToken"},
      );
      return res;
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommentModel> postComment({
    required int id,
    required String comment,
    int? commentId,
  }) async {
    try {
      print(commentId);
      final res = await client.postRequest(
        ApiConstants.postComment(id),
        headers: {'Authorization': "Bearer $accessToken"},
        data: {'parent': commentId ?? '', "content": comment},
      );
      return CommentModel.fromJson(res);
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future viewToPost({required int id}) async {
    try {
      final res = await client.postRequest(
        ApiConstants.viewToNews(id),
        headers: {'Authorization': "Bearer $accessToken"},
      );
      return res;
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future likeToComment({required int id}) async {
    try {
      final res = await client.postRequest(
        ApiConstants.likeToComment(id),
        headers: {'Authorization': "Bearer $accessToken"},
      );
      print(res);
      return res;
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }
}

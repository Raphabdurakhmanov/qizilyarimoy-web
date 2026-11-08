import 'package:app/config/api_constants.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/profile/data/models/guideline_model.dart';
import 'package:dio/dio.dart';

abstract class GuidelineRemoteDataSource {
  Future<PaginatedGuidelineModel> fetchGuidelines();
}

class GuidelineRemoteDataSourceImpl implements GuidelineRemoteDataSource {
  final ApiClient client;

  GuidelineRemoteDataSourceImpl({required this.client});

  @override
  Future<PaginatedGuidelineModel> fetchGuidelines() async {
    try {
      final response = await client.getRequest(ApiConstants.guideline);
      return PaginatedGuidelineModel.fromJson(response);
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }
}

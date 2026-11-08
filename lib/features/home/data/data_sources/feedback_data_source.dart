import 'package:app/config/api_constants.dart';
import 'package:app/config/constants.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/home/data/models/feedback_model.dart';

abstract class FeedbackDataSource {
  Future<dynamic> sendFeedback({required FeedbackModel feedback});
}

class FeedbackDataSourceImpl implements FeedbackDataSource {
  ApiClient client;

  FeedbackDataSourceImpl({required this.client});
  @override
  Future<dynamic> sendFeedback({required FeedbackModel feedback}) async {
    final res = await client.postRequest(
      ApiConstants.feedback,
      headers: {'Authorization': "Bearer $accessToken"},
      data: feedback.toJson(),
    );
    return res;
  }
}

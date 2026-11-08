import 'package:app/config/api_constants.dart';
import 'package:app/config/constants.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/home/data/models/notification_model.dart';

abstract class NotificationDataSource {
  Future<List<NotificationModel>> fetchNotifications();
}

class NotificationDataSourceImpl implements NotificationDataSource {
  final ApiClient client;

  NotificationDataSourceImpl({required this.client});
  @override
  Future<List<NotificationModel>> fetchNotifications() async {
    final res = await client.getRequest(
      ApiConstants.notifications,
      headers: {'Authorization': "Bearer $accessToken"},
    );
    return (res['data'] as List)
        .map((item) => NotificationModel.fromJson(item))
        .toList();
  }
}

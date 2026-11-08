import 'package:app/config/api_constants.dart';
import 'package:app/config/constants.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/course/data/models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> fetchTasks(int id);
}

class TaskRemoteDataSourceImpl extends TaskRemoteDataSource {
  ApiClient client;

  TaskRemoteDataSourceImpl({required this.client});
  @override
  Future<List<TaskModel>> fetchTasks(int id) async {
    var res = await client.getRequest(
      ApiConstants.tasks(id),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    return (res['tasks'] ?? [])
        .map<TaskModel>((e) => TaskModel.fromJson(e))
        .toList();
  }
}

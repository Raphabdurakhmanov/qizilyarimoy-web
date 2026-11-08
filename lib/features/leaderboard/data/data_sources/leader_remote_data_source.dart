import 'package:app/config/api_constants.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/enums/leader_type.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/leaderboard/data/models/leaderboard_model.dart';

abstract class LeaderRemoteDataSource {
  Future<PaginatedLeaderboardModel> getLeaderboard({
    String? url,
    required LeaderboardType type,
  });
}

class LeaderRemoteDataSourceImpl implements LeaderRemoteDataSource {
  ApiClient client;

  LeaderRemoteDataSourceImpl({required this.client});

  @override
  Future<PaginatedLeaderboardModel> getLeaderboard({
    String? url,
    required LeaderboardType type,
  }) async {
    final res = await client.getRequest(
      url ?? ApiConstants.leaderboard,
      headers: {'Authorization': "Bearer $accessToken"},
      params: {
        'ordering':
            type == LeaderboardType.rating
                ? '-task_completed' // '-' for reverse this list
                : 'productivity_progress',
      },
    );

    return PaginatedLeaderboardModel.fromJson(res);
  }
}

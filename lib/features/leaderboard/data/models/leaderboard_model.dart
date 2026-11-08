import 'package:app/config/constants.dart';
import 'package:app/features/leaderboard/domain/entities/leaderboard_entity.dart';

class PaginatedLeaderboardModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<LeaderboardModel>? results;

  PaginatedLeaderboardModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PaginatedLeaderboardModel.fromJson(Map<String, dynamic> json) =>
      PaginatedLeaderboardModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            json["results"] == null
                ? []
                : List<LeaderboardModel>.from(
                  json["results"]!.map((x) => LeaderboardModel.fromJson(x)),
                ),
      );
  PaginatedLeaderboardEntity toEntity() {
    return PaginatedLeaderboardEntity(
      count: count,
      next: next,
      previous: previous,
      results: results?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

class LeaderboardModel {
  final String? username;
  final double? productivityProgress;
  final int? taskCompleted;
  final String? avatar;
  final DateTime? updatedAt;

  LeaderboardModel({
    this.username,
    this.productivityProgress,
    this.taskCompleted,
    this.updatedAt,
    this.avatar,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) =>
      LeaderboardModel(
        username: json["username"],
        productivityProgress: json["productivity_progress"],
        taskCompleted: json["task_completed"],
        avatar: json['avatar'] ?? AppConstants.defaultAvatar,
        updatedAt:
            json["updated_at"] == null
                ? null
                : DateTime.parse(json["updated_at"]),
      );

  LeaderboardEntity toEntity() {
    return LeaderboardEntity(
      productivityProgress: productivityProgress,
      taskCompleted: taskCompleted,
      updatedAt: updatedAt,
      avatar: avatar,
      username: username,
    );
  }
}

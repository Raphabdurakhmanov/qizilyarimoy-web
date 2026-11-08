import 'package:app/config/constants.dart';
import 'package:equatable/equatable.dart';

class PaginatedLeaderboardEntity extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<LeaderboardEntity>? results;

  const PaginatedLeaderboardEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}

class LeaderboardEntity extends Equatable {
  final String? username;
  final double? productivityProgress;
  final int? taskCompleted;
  final String? avatar;
  final DateTime? updatedAt;

  const LeaderboardEntity({
    this.username,
    this.productivityProgress,
    this.taskCompleted,
    this.updatedAt,
    this.avatar = AppConstants.defaultAvatar,
  });

  @override
  List<Object?> get props => [
    username,
    productivityProgress,
    taskCompleted,
    avatar,
    updatedAt,
  ];
}

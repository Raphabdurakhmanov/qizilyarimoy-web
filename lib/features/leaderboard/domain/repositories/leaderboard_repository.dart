import 'package:app/config/enums/leader_type.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/leaderboard/domain/entities/leaderboard_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LeaderboardRepository {
  Future<Either<Failure, PaginatedLeaderboardEntity>> getLeaderboard({
    String? url,
    required LeaderboardType type,
  });
}

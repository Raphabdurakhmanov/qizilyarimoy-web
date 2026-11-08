import 'package:app/config/enums/leader_type.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/leaderboard/domain/entities/leaderboard_entity.dart';
import 'package:app/features/leaderboard/domain/repositories/leaderboard_repository.dart';
import 'package:dartz/dartz.dart';

class LeaderUsecase {
  LeaderboardRepository repository;

  LeaderUsecase({required this.repository});

  Future<Either<Failure, PaginatedLeaderboardEntity>> call({
    String? url,
    required LeaderboardType type,
  }) async {
    return await repository.getLeaderboard(url: url, type: type);
  }
}

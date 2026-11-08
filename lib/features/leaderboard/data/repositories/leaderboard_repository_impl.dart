import 'package:app/config/enums/leader_type.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/leaderboard/data/data_sources/leader_remote_data_source.dart';
import 'package:app/features/leaderboard/domain/entities/leaderboard_entity.dart';
import 'package:app/features/leaderboard/domain/repositories/leaderboard_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class LeaderboardRepositoryImpl implements LeaderboardRepository {
  NetworkInfo networkInfo;
  LeaderRemoteDataSource dataSource;

  LeaderboardRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PaginatedLeaderboardEntity>> getLeaderboard({
    String? url,
    required LeaderboardType type,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.getLeaderboard(url: url, type: type);
        return Right(res.toEntity());
      } on Failure catch (failure) {
        return Left(failure);
        } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }
}
import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/profile/data/data_sources/guideline_remote_data_source.dart';
import 'package:app/features/profile/domain/entities/guideline_entity.dart';
import 'package:app/features/profile/domain/repositories/guideline_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class GuidelineRepositoryImpl implements GuidelineRepository {
  final GuidelineRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GuidelineRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PaginatedGuidelineEntity>> getGuidelines() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteGuidelines = await remoteDataSource.fetchGuidelines();
        return Right(remoteGuidelines);
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

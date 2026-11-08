import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/home/data/data_sources/feedback_data_source.dart';
import 'package:app/features/home/data/models/feedback_model.dart';
import 'package:app/features/home/domain/repositories/feedback_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  NetworkInfo networkInfo;
  FeedbackDataSource dataSource;

  FeedbackRepositoryImpl({required this.dataSource, required this.networkInfo});
  @override
  Future<Either<Failure, dynamic>> sendFeedback({
    required FeedbackModel feedback,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.sendFeedback(feedback: feedback);
        return Right(res);
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

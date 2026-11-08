import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/home/data/data_sources/notification_data_source.dart';
import 'package:app/features/home/domain/entities/notification_entity.dart';
import 'package:app/features/home/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NetworkInfo networkInfo;
  final NotificationDataSource dataSource;

  NotificationRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<NotificationEntity>>> fetchNotifications() async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.fetchNotifications();
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

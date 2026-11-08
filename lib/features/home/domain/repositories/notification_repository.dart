import 'package:app/core/error/failure.dart';
import 'package:app/features/home/domain/entities/notification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> fetchNotifications();
}
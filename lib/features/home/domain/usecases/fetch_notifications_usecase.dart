import 'package:app/core/error/failure.dart';
import 'package:app/features/home/domain/entities/notification_entity.dart';
import 'package:app/features/home/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class FetchNotificationsUseCase {
  final NotificationRepository repository;

  FetchNotificationsUseCase(this.repository);

  Future<Either<Failure, List<NotificationEntity>>> call() async {
    return repository.fetchNotifications();
  }
}

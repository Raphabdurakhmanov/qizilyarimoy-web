import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase {
  final UserRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<Failure, dynamic>> call() async {
    return await repository.logout();
  }
}

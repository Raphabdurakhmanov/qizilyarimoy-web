import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final UserRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Either<Failure, dynamic>> call({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await repository.changePassword(
      newPassword: newPassword,
      oldPassword: oldPassword,
    );
  }
}

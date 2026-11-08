import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeAvatarUseCase {
  UserRepository repository;
  ChangeAvatarUseCase(this.repository);

  Future<Either<Failure, dynamic>> call({required String avatarPath}) async {
    return repository.changeAvatar(avatarPath: avatarPath);
  }
}

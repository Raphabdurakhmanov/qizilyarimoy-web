import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/entities/profile_entity.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileUseCase {
  final UserRepository repository;

  ProfileUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call() async {
    return await repository.getUserProfile();
  }
}

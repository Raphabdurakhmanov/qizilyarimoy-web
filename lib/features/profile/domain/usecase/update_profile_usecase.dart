import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase {
  final UserRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, dynamic>> call({
    String? firstName,
    String? lastName,
    String? region,
  }) async {
    return await repository.updateUserProfile(
      firstName: firstName,
      lastName: lastName,
      region: region,
    );
  }
}

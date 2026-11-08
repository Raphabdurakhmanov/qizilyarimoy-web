import 'package:dartz/dartz.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/auth/domain/entities/user_entity.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';

class CheckAuthStatusUsecase {
  final AuthRepository repository;

  CheckAuthStatusUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    return await repository.getLastUser();
  }
}

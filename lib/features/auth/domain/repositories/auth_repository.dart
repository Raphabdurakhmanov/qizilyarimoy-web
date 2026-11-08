import 'package:app/core/error/failure.dart';
import 'package:app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String username, String password);
  Future<Either<Failure, UserEntity>> getLastUser();
  Future<Either<Failure, dynamic>> refreshToken();
}

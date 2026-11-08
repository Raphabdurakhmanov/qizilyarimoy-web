import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/entities/mycourse_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/profile_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, ProfileEntity>> getUserProfile();
  Future<Either<Failure, dynamic>> updateUserProfile({
    String? firstName,
    String? lastName,
    String? region,
  });
  Future<Either<Failure, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<Failure, dynamic>> logout();
  Future<Either<Failure, dynamic>> changeAvatar({required String avatarPath});
  Future<Either<Failure, List<MyCourseEntity>>> getMyCourses();
  Future<Either<Failure, dynamic>> deleteAccount();
}

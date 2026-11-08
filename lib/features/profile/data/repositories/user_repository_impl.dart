import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:app/features/profile/data/data_sources/user_remote_data_source.dart';
import 'package:app/features/profile/domain/entities/mycourse_entity.dart';
import 'package:app/features/profile/domain/entities/profile_entity.dart';
import 'package:app/features/profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.changePassword(
          oldPassword,
          newPassword,
        );
        return Right(response);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getUserProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getUserProfile();
        return Right(response.toEntity());
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.logout();
        await localDataSource.clearUser();
        return Right(response);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateUserProfile({
    String? firstName,
    String? lastName,
    String? region,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updateUserProfile(
          firstName: firstName,
          lastName: lastName,
          region: region,
        );
        return Right(response);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> changeAvatar({
    required String avatarPath,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.changeAvatar(
          avatarPath: avatarPath,
        );
        return Right(response);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, List<MyCourseEntity>>> getMyCourses() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getMyCourses();
        return Right(response);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteAccount() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.deleteAccount();
        await localDataSource.clearUser();
        return Right(response);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }
}

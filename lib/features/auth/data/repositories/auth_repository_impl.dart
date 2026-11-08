import 'package:app/config/constants.dart';
import 'package:app/core/error/exception.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:app/features/auth/data/model/user_model.dart';
import 'package:app/features/auth/domain/entities/user_entity.dart';
import 'package:app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo network;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.network,
  });

  @override
  Future<Either<Failure, UserEntity>> login(
    String username,
    String password,
  ) async {
    if (await network.isConnected) {
      try {
        final user = await remoteDataSource.login(username, password);
        accessToken = user.accessToken;
        refreshTokenData = user.refreshToken;
        await localDataSource.cacheUser(user);
        return Right(user.toEntity());
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
  Future<Either<Failure, UserEntity>> getLastUser() async {
    try {
      final user = await localDataSource.getLastUser();
      accessToken = user.accessToken;
      refreshTokenData = user.refreshToken;
      print(accessToken);
      return Right(user.toEntity());
    } catch (e) {
      return Left(CacheFailure("cache_error".tr()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> refreshToken() async {
    if (await network.isConnected) {
      try {
        final oldUser = await localDataSource.getLastUser();
        final newTokens = await remoteDataSource.refreshToken();

        final updatedUser = UserModel(
          user: oldUser.user,
          accessToken: newTokens.accessToken,
          refreshToken: newTokens.refreshToken,
        );
        accessToken = updatedUser.accessToken;
        refreshTokenData = updatedUser.refreshToken;
        await localDataSource.cacheUser(updatedUser);
        return Right(updatedUser.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }
}

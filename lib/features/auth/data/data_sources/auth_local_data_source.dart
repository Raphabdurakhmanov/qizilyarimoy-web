import 'package:app/config/constants.dart';
import 'package:app/features/auth/data/model/user_collection.dart';
import 'package:app/features/auth/data/model/user_model.dart';
import 'package:app/core/database/local_storage.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> getLastUser();

  Future<void> cacheUser(UserModel userToCache);

  Future<void> clearUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalStorage storage;
  AuthLocalDataSourceImpl({required this.storage});
  @override
  Future<void> cacheUser(UserModel userToCache) async {
    var expireTokenDate = DateTime.now().add(tokenExpiredDuration);
    final userIsar =
        UserCollection()
          ..firstname = userToCache.user?.firstName
          ..email = userToCache.user?.email
          ..lastName = userToCache.user?.lastName
          ..fullName = userToCache.user?.fullName
          ..phone = userToCache.user?.phone
          ..region = userToCache.user?.region
          ..avatar = userToCache.user?.avatar
          ..language = userToCache.user?.language
          ..tokenExpiry = expireTokenDate
          ..productivityScore = userToCache.user?.productivityScore
          ..totalTasksCompleted = userToCache.user?.totalTasksCompleted
          ..completedCoursesCount = userToCache.user?.completedCoursesCount
          ..dateJoined = userToCache.user?.dateJoined
          ..username = userToCache.user?.username ?? ''
          ..id = userToCache.user?.id.toString() ?? '';

    // Set the token if it exists
    if (userToCache.accessToken != null || userToCache.refreshToken != null) {
      userIsar.accessToken = userToCache.accessToken ?? '';
      userIsar.refreshToken = userToCache.refreshToken ?? '';
    }
    await storage.saveUser(userIsar);
  }

  @override
  Future<UserModel> getLastUser() async {
    final userIsar = storage.getUser();
    if (userIsar == null) {
      throw StateError('No cached user');
    }
    tokenExpirationDate = userIsar.tokenExpiry;
    return UserModel(
      user: UserDataModel(
        avatar: userIsar.avatar,
        email: userIsar.email,
        firstName: userIsar.firstname,
        fullName: userIsar.fullName,
        id: int.tryParse(userIsar.id) ?? 0,
        lastName: userIsar.lastName,
        phone: userIsar.phone,
        productivityScore: userIsar.productivityScore,
        region: userIsar.region,
        completedCoursesCount: userIsar.completedCoursesCount,
        totalTasksCompleted: userIsar.totalTasksCompleted,
        dateJoined: userIsar.dateJoined,
        language: userIsar.language,
        username: userIsar.username,
      ),
      accessToken: userIsar.accessToken,
      refreshToken: userIsar.refreshToken,
    );
  }

  @override
  Future<void> clearUser() async {
    print("Cleaning...");
    await storage.clearUser();
  }
}

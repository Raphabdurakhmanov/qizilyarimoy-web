import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;

  DioInterceptor({required this.dio});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // try {
    //   final user = await authLocalDataSource.getLastUser();
    //   if (user.accessToken != null) {
    //     options.headers['Authorization'] = 'Bearer ${user.accessToken}';
    //   }
    // } catch (e) {
    //   // No user cached, proceed without token
    // }
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      //   try {
      //     // 1. Get refresh token
      //     final oldUser = await authLocalDataSource.getLastUser();
      //     final refreshToken = oldUser.refreshToken;

      //     if (refreshToken == null) {
      //       // No refresh token, propagate error
      //       return handler.next(err);
      //     }

      //     // 2. Refresh the token
      //     final newTokens = await authRemoteDataSource.refreshToken(refreshToken);

      //     // 3. Save new tokens

      //     final updatedUser = UserModel(
      //       user: oldUser.user,
      //       accessToken: newTokens.accessToken,
      //       refreshToken: newTokens.refreshToken,
      //     );
      //     await authLocalDataSource.cacheUser(updatedUser);
      //     // 4. Retry the original request with the new token
      //     final opts = err.requestOptions;
      //     opts.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';
      //     final response = await dio.fetch(opts);
      //     return handler.resolve(response);
      //   } on DioException {
      //     // If refresh fails, log out user or propagate error
      //     await authLocalDataSource.clearUser();
      //     // You might want to navigate to login screen here
      //     return handler.next(err);
      //   } catch (e) {
      //     return handler.next(err);
      //   }
      // }
      return handler.next(err);
    }
  }
}

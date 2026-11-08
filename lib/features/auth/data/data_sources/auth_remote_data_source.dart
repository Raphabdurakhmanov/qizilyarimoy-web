import 'package:app/config/api_constants.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/models/token_model.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
  Future<TokenModel> refreshToken();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiClient client;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<UserModel> login(String username, String password) async {
    var res = await client.postRequest(
      ApiConstants.login,
      data: {'username': username, 'password': password},
    );
    return UserModel.fromJson(res);
  }

  @override
  Future<TokenModel> refreshToken() async {
    var res = await client.postRequest(
      ApiConstants.refreshToken,
      data: {'refresh': refreshTokenData},
    );
    return TokenModel.fromJson(res);
  }
}

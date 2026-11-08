import 'package:app/config/api_constants.dart';
import 'package:app/config/constants.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/profile/data/models/mycourse_model.dart';
import 'package:app/features/profile/data/models/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart' show XFile;

abstract class UserRemoteDataSource {
  Future<ProfileModel> getUserProfile();
  Future<dynamic> updateUserProfile({
    String? firstName,
    String? lastName,
    String? region,
  });
  Future<dynamic> changePassword(String oldPassword, String newPassword);
  Future<dynamic> logout();
  Future<dynamic> changeAvatar({required String avatarPath});
  Future<List<MyCourseModel>> getMyCourses();
  Future<dynamic> deleteAccount();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  ApiClient client;

  UserRemoteDataSourceImpl({required this.client});
  @override
  Future<dynamic> changePassword(String oldPassword, String newPassword) async {
    final response = await client.putRequest(
      ApiConstants.changePassword,
      headers: {"Authorization": "Bearer $accessToken"},
      data: {
        "old_password": oldPassword,
        "new_password": newPassword,
        "new_password_confirm": newPassword,
      },
    );
    return response;
  }

  @override
  Future<ProfileModel> getUserProfile() async {
    try {
      final response = await client.getRequest(
        ApiConstants.profile,
        headers: {"Authorization": "Bearer $accessToken"},
      );
      return ProfileModel.fromJson(response['data']);
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> logout() async {
    try {
      final response = await client.postRequest(
        ApiConstants.logout,
        headers: {"Authorization": "Bearer $accessToken"},
        data: {"refresh": refreshTokenData},
      );
      return response;
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> updateUserProfile({
    String? firstName,
    String? lastName,
    String? region,
  }) async {
    try {
      final response = await client.putRequest(
        ApiConstants.editProfile,
        headers: {"Authorization": "Bearer $accessToken"},
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "region": region,
        },
      );

      return response;
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MyCourseModel>> getMyCourses() async {
    final response = await client.getRequest(
      ApiConstants.myCourses,
      headers: {"Authorization": "Bearer $accessToken"},
    );
    print(response);
    return (response['data'] as List)
        .map((course) => MyCourseModel.fromJson(course))
        .toList();
  }

  @override
  Future changeAvatar({required String avatarPath}) async {
    final response = await client.putRequest(
      ApiConstants.avatar,
      headers: {"Authorization": "Bearer $accessToken"},
      data: FormData.fromMap({
        // fromBytes works on mobile and web (blob: paths on web)
        "avatar": MultipartFile.fromBytes(
          await XFile(avatarPath).readAsBytes(),
          filename: _avatarFileName(avatarPath),
        ),
      }),
    );
    return response['avatar'];
  }

  @override
  Future deleteAccount() async {
    try {
      final response = await client.deleteRequest(
        ApiConstants.deleteAccount,
        headers: {"Authorization": "Bearer $accessToken"},
      );
      return response;
    } on DioException catch (e) {
      throw handleNetworkFailure(e);
    } catch (e) {
      rethrow;
    }
  }
}

String _avatarFileName(String path) {
  final last = path.split('/').last;
  return last.contains('.') ? last : 'avatar.jpg';
}

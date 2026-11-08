// api_client.dart
import 'package:app/config/api_constants.dart';
import 'package:app/core/error/failure.dart';
import 'package:dio/dio.dart';

import '../error/exception.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(
        milliseconds: ApiConstants.timeoutDuration * 1000,
      ), // milliseconds
      receiveTimeout: Duration(
        milliseconds: ApiConstants.timeoutDuration * 1000,
      ), // milliseconds
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<dynamic> getRequest(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: params,
        options: headers != null ? Options(headers: headers) : null,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<dynamic> getRequestUri(Uri endpoint) async {
    try {
      final response = await dio.getUri(endpoint);
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<dynamic> postRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: headers != null ? Options(headers: headers) : null,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<dynamic> putRequest(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        options: headers != null ? Options(headers: headers) : null,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<dynamic> deleteRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.delete(
        endpoint,
        data: data,
        options: headers != null ? Options(headers: headers) : null,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  dynamic _processResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      throw ServerException(
        "Error occurred while communicating with server: ${response.statusCode}",
      );
    }
  }

  Exception _handleDioError(DioException error) {
    throw handleNetworkFailure(error);

    // switch (error.type) {
    //   case DioExceptionType.connectionTimeout:
    //     return NetworkException("Connection timed out");
    //   case DioExceptionType.sendTimeout:
    //     return NetworkException("Request timed out");
    //   case DioExceptionType.receiveTimeout:
    //     return NetworkException("Response timed out");
    //   case DioExceptionType.badResponse:
    //     return ServerException(
    //       "Server error: ${error.response?.statusMessage} (${error.response?.statusCode})",
    //     );
    //   case DioExceptionType.cancel:
    //     return NetworkException("Request cancelled");
    //   case DioExceptionType.unknown:
    //   default:
    //     return NetworkException(error.message ?? ApiConstants.unknownError);
    // }
  }
}

import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  ServerException(this.message);

  @override
  String toString() => "ServerException: $message";
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => "NetworkException: $message";
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);

  @override
  String toString() => "CacheException: $message";
}

class CustomDioException implements Exception {
  final String message;
  CustomDioException(this.message);

  
  static handleException(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return ServerException("Bad Request: ${error.message}");
      case 401:
        return ServerException("Unauthorized: ${error.message}");
      case 403:
        return ServerException("Forbidden: ${error.message}");
      case 404:
        return ServerException("Not Found: ${error.message}");
      case 500:
        return ServerException("Internal Server Error: ${error.message}");
      default:
        return ServerException("Unexpected error: ${error.message}");
    }
  }
}
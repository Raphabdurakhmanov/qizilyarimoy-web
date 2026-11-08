import 'package:app/config/enums/failure_type.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  final String message;
  FailureType type;
  Failure(this.message, {this.type = FailureType.unknown});
}

class ServerFailure extends Failure {
  ServerFailure(super.message) : super(type: FailureType.serverError);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message) : super(type: FailureType.networkError);
}

class UnknownFailure extends Failure {
  bool? isCourseCompleted;
  UnknownFailure(super.message, {this.isCourseCompleted})
    : super(type: FailureType.unknown);
}

class CacheFailure extends Failure {
  CacheFailure(super.message) : super(type: FailureType.cacheError);
}

class UnauthenticatedFailure extends Failure {
  UnauthenticatedFailure(super.message)
    : super(type: FailureType.unauthenticated);
}

class BadRequestFailure extends Failure {
  BadRequestFailure(super.message) : super(type: FailureType.badRequest);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(super.message) : super(type: FailureType.notFound);
}

handleNetworkFailure(DioException error) {
  print(isCourseCompleted(error));
  print("isCourseCompleted(error)");
  switch (error.response?.statusCode) {
    case 400:
      String message =
          error.response?.data['error']['message'] ??
          "An unexpected error occurred";
      return BadRequestFailure(message);
    case 401:
      return UnauthenticatedFailure("Unauthorized: ${error.message}");
    case 403:
      return ServerFailure("Forbidden: ${error.message}");
    case 404:
      return NotFoundFailure("Not Found: ${error.message}");
    case 500:
      return ServerFailure("Internal Server Error: ${error.message}");
    default:
      if (isCourseCompleted(error)) {
        return UnknownFailure("course_completed".tr(), isCourseCompleted: true);
      }
      return UnknownFailure("Unexpected error: ${error.message}");
  }
}

isCourseCompleted(DioException error) {
  try {
    var res = error.response;
    if (res?.statusCode == 200 && (res?.data['is_course_completed'] ?? false)) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

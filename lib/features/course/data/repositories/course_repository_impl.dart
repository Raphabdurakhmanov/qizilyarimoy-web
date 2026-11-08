import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/course/data/data_sources/course_remote_data_source.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/entities/module_entity.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class CourseRepositoryImpl implements CourseRepository {
  CourseRemoteDataSource dataSource;
  NetworkInfo networkInfo;

  CourseRepositoryImpl({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, CourseEntity>> getCourseDetails(int courseId) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.getCourseDetails(courseId);
        return Right(res.toEntity());
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
  Future<Either<Failure, PaginatedCourseEntity>> getCourses({
    String? url,
    String? order,
    String? search,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.getAllCourses(
          url: url,
          order: order,
          search: search,
        );
        return Right(res.toEntity());
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
  Future<Either<Failure, PaginatedModuleEntity>> getCourseModules(
    int courseId, {
    String? url,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.getCourseModules(courseId, url: url);
        return Right(res.toEntity());
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
  Future<Either<Failure, List<CommentEntity>>> fetchComments(
    int courseId, {
    String? url,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.fetchComments(courseId, url: url);
        return Right(res.map((e) => e.toEntity()).toList());
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
  Future<Either<Failure, dynamic>> sendComment({
    required int courseId,
    required String text,
    int? parent,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.sendComment(
          courseId: courseId,
          text: text,
          parent: parent,
        );
        return Right(res);
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
  Future<Either<Failure, List<CommentEntity>>> likeToCourseComment(
    int commentId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.likeToComment(id: commentId);
        return Right(res);
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
  Future<Either<Failure, LessonEntity>> enrollCourse(int courseId) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.enrollCourse(courseId);
        return Right(res.toEntity());
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
  Future<Either<Failure, LessonEntity>> getActiveLesson(int courseId) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.getActiveLesson(courseId);
        return Right(res.toEntity());
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
  Future<Either<Failure, LessonEntity>> nextLesson(
    int courseId,
    int lessonId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.nextLesson(courseId, lessonId);
        return Right(res.toEntity());
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
  Future<Either<Failure, LessonEntity>> previousLesson(
    int courseId,
    int lessonId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.previousLesson(courseId, lessonId);
        return Right(res.toEntity());
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
  Future<Either<Failure, dynamic>> rateCourse(int courseId, int rating) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.rateCourse(courseId, rating);
        return Right(res);
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

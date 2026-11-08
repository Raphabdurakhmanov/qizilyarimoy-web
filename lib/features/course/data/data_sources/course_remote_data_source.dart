import 'package:app/config/api_constants.dart';
import 'package:app/config/constants.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/core/network/api_client.dart';
import 'package:app/features/course/data/models/course_model.dart';
import 'package:app/features/course/data/models/lesson_model.dart';
import 'package:app/features/course/data/models/module_model.dart';
import 'package:app/features/lenta/data/models/comment_model.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class CourseRemoteDataSource {
  Future<PaginatedCourseModel> getAllCourses({
    String? url,
    String? order,
    String? search,
  });
  Future<CourseModel> getCourseDetails(int courseId);
  Future<PaginatedModuleModel> getCourseModules(int courseId, {String? url});
  Future<LessonModel> enrollCourse(int courseId);
  Future<LessonModel> getActiveLesson(int courseId);
  Future<LessonModel> previousLesson(int courseId, int lessonId);
  Future<LessonModel> nextLesson(int courseId, int lessonId);
  // For comments
  Future<List<CommentModel>> fetchComments(int courseId, {String? url});
  Future<dynamic> likeToComment({required int id});
  Future<dynamic> sendComment({
    required int courseId,
    required String text,
    int? parent,
  });
  Future<dynamic> rateCourse(int courseId, int rating);
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  ApiClient client;

  CourseRemoteDataSourceImpl({required this.client});
  @override
  Future<PaginatedCourseModel> getAllCourses({
    String? url,
    String? order,
    String? search,
  }) async {
    Map<String, String> params = {};
    if (order != null) {
      params["ordering"] = order;
    }
    if (search != null) {
      params["search"] = search;
    }
    final res = await client.getRequest(
      url ?? ApiConstants.courses,
      headers: {'Authorization': "Bearer $accessToken"},
      params: params,
    );
    return PaginatedCourseModel.fromJson(res);
  }

  @override
  Future<CourseModel> getCourseDetails(int courseId) async {
    final res = await client.getRequest(
      ApiConstants.courseDetails(courseId),
      headers: {'Authorization': "Bearer $accessToken"},
    );

    return CourseModel.fromJson(res);
  }

  @override
  Future<LessonModel> enrollCourse(int courseId) async {
    final res = await client.postRequest(
      ApiConstants.enrollCourse(courseId),
      headers: {'Authorization': "Bearer $accessToken"},
    );
    return LessonModel.fromJson(res['data']['active_lesson']);
  }

  @override
  Future<PaginatedModuleModel> getCourseModules(
    int courseId, {
    String? url,
  }) async {
    final res = await client.getRequest(
      url ?? ApiConstants.courseModules(courseId),
      headers: {'Authorization': "Bearer $accessToken"},
    );

    return PaginatedModuleModel.fromJson(res);
  }

  @override
  Future<List<CommentModel>> fetchComments(int courseId, {String? url}) async {
    final res = await client.getRequest(
      url ?? ApiConstants.courseComments(courseId),
      headers: {'Authorization': "Bearer $accessToken"},
    );
    return List<CommentModel>.from(
      res.map((comment) => CommentModel.fromJson(comment)),
    );
  }

  @override
  Future<dynamic> sendComment({
    required int courseId,
    required String text,
    int? parent,
  }) async {
    final res = await client.postRequest(
      ApiConstants.createCourseComment(courseId),
      data: {'content': text, 'parent': parent, 'course': courseId},
      headers: {'Authorization': "Bearer $accessToken"},
    );
    return res;
  }

  @override
  Future likeToComment({required int id}) async {
    final res = await client.postRequest(
      ApiConstants.likeToCourseComment(id),
      headers: {'Authorization': "Bearer $accessToken"},
    );
    return res;
  }

  @override
  Future<LessonModel> getActiveLesson(int courseId) async {
    final res = await client.getRequest(
      ApiConstants.activeLesson(courseId),
      headers: {'Authorization': "Bearer $accessToken"},
    );
    return LessonModel.fromJson(res['data']);
  }

  @override
  Future<LessonModel> nextLesson(int courseId, int lessonId) async {
    final res = await client.getRequest(
      ApiConstants.nextLesson(courseId, lessonId),
      headers: {'Authorization': "Bearer $accessToken"},
    );
    if (res['data'] == null && res['is_course_completed']) {
      throw UnknownFailure("course_completed".tr(), isCourseCompleted: true);
    }
    return LessonModel.fromJson(res['data']);
  }

  @override
  Future<LessonModel> previousLesson(int courseId, int lessonId) async {
    final res = await client.getRequest(
      ApiConstants.previousLesson(courseId, lessonId),
      headers: {'Authorization': "Bearer $accessToken"},
    );
    return LessonModel.fromJson(res['data']);
  }

  @override
  Future<dynamic> rateCourse(int courseId, int rating) async {
    final res = await client.postRequest(
      ApiConstants.courseRate(courseId),
      headers: {'Authorization': "Bearer $accessToken"},
      data: {"rating": rating},
    );
    return res;
  }
}

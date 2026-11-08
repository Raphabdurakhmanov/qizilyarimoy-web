part of 'course_details_bloc.dart';

@freezed
class CourseDetailsEvent with _$CourseDetailsEvent {
  const factory CourseDetailsEvent.fetchCourseModules(int courseId) =
      _FetchCourseModules;

  const factory CourseDetailsEvent.fetchComments(int courseId, {String? url}) =
      _FetchComments;
  const factory CourseDetailsEvent.getCourseDetails(int courseId) =
      _GetCourseDetails;
  const factory CourseDetailsEvent.enrollCourse(int courseId) = _EnrollCourse;
  const factory CourseDetailsEvent.sendComment({
    required int courseId,
    required String text,
    int? parent,
  }) = _SendComment;

  const factory CourseDetailsEvent.likeComment(int commentId) = _LikeComment;
  const factory CourseDetailsEvent.completeLesson(LessonEntity lesson) =
      _CompleteLesson;
}

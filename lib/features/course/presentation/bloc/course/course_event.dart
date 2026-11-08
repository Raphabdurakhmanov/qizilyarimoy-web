part of 'course_bloc.dart';

@freezed
sealed class CourseEvent with _$CourseEvent {
  const factory CourseEvent.fetchCourses({String? order, String? search}) =
      _FetchCourses;

  const factory CourseEvent.changeActiveLesson(
    LessonEntity activeLesson,
    int courseId,
  ) = _ChangeActiveLesson;
}

part of 'course_bloc.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState.initial() = _Initial;
  const factory CourseState.loading() = _Loading;
  const factory CourseState.error(Failure failure) = _Error;

  // A single 'Loaded' state to hold all data
  const factory CourseState.loaded({
    List<CourseEntity>? courses,
    bool? hasReachedMaxCourses,
  }) = _Loaded;
}

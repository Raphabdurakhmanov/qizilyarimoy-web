part of 'my_courses_bloc.dart';

@freezed
class MyCoursesState with _$MyCoursesState {
  const factory MyCoursesState.initial() = _Initial;
  const factory MyCoursesState.loading() = _Loading;
  const factory MyCoursesState.loaded(List<MyCourseEntity> courses) = _Loaded;
  const factory MyCoursesState.error(String message) = _Error;
}

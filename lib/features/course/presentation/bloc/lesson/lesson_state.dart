part of 'lesson_bloc.dart';

@freezed
class LessonState with _$LessonState {
  const factory LessonState.initial() = _Initial;
  const factory LessonState.loading() = _Loading;
  const factory LessonState.loaded(LessonEntity lesson) = _Loaded;
  const factory LessonState.error(Failure failure) = _Error;
}

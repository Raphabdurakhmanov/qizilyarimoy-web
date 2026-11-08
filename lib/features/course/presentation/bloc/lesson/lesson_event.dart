part of 'lesson_bloc.dart';

@freezed
sealed class LessonEvent with _$LessonEvent {
  const factory LessonEvent.activeLesson(int courseId) = _ActiveLesson;
  const factory LessonEvent.nextLesson(int courseId, int lessonId) =
      _NextLesson;
  const factory LessonEvent.previousLesson(int courseId, int lessonId) =
      _PreviousLesson;
}

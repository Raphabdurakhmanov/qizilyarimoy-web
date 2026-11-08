import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/usecases/active_lesson_usecase.dart';
import 'package:app/features/course/domain/usecases/next_lesson_usecase.dart';
import 'package:app/features/course/domain/usecases/previous_lesson_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';
part 'lesson_bloc.freezed.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  ActiveLessonUsecase activeLessonUsecase;
  NextLessonUsecase nextLessonUsecase;
  PreviousLessonUsecase previousLessonUsecase;

  LessonBloc({
    required this.activeLessonUsecase,
    required this.nextLessonUsecase,
    required this.previousLessonUsecase,
  }) : super(LessonState.initial()) {
    on<LessonEvent>((event, emit) async {
      await event.map(
        activeLesson: (e) async {
          emit(LessonState.loading());
          final result = await activeLessonUsecase(e.courseId);
          result.fold(
            (failure) => emit(LessonState.error(failure)),
            (lesson) => emit(LessonState.loaded(lesson)),
          );
        },
        nextLesson: (e) async {
          emit(LessonState.loading());
          final result = await nextLessonUsecase(e.courseId, e.lessonId);
          result.fold(
            (failure) => emit(LessonState.error(failure)),
            (lesson) => emit(LessonState.loaded(lesson)),
          );
        },
        previousLesson: (e) async {
          emit(LessonState.loading());
          final result = await previousLessonUsecase(e.courseId, e.lessonId);
          result.fold(
            (failure) => emit(LessonState.error(failure)),
            (lesson) => emit(LessonState.loaded(lesson)),
          );
        },
      );
    });
  }
}

import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';

import 'package:app/features/course/domain/usecases/courses_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'course_event.dart';
part 'course_state.dart';
part 'course_bloc.freezed.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CoursesUsecase _coursesUsecase;
  // State for course list pagination and filtering
  String? _coursesNextPageUrl;
  String? _courseSearch;
  String? _courseOrdering;

  CourseBloc({required CoursesUsecase coursesUsecase})
    : _coursesUsecase = coursesUsecase,

      super(const CourseState.initial()) {
    on<CourseEvent>((event, emit) async {
      await event.map(
        fetchCourses: (event) => _onFetchCourses(event, emit),
        changeActiveLesson: (_ChangeActiveLesson value) {
          currentState
              .courses
              ?.firstWhere((course) => course.id == value.courseId)
              .activeLesson
              .value = value.activeLesson;
          emit(currentState.copyWith(courses: currentState.courses));
        },
      );
    }, transformer: throttleDroppable(throttleDuration));
  }

  _Loaded get currentState =>
      state.maybeMap(loaded: (s) => s, orElse: () => const _Loaded());

  Future<void> _onFetchCourses(
    _FetchCourses event,
    Emitter<CourseState> emit,
  ) async {
    final isNewFilter =
        (event.search == null && event.order == null) ||
        (event.search != _courseSearch || event.order != _courseOrdering);
    if (isNewFilter) {
      _coursesNextPageUrl = null;
      _courseSearch = event.search;
      _courseOrdering = event.order;
      print("------ Courses Loading -------");
      emit(const CourseState.loading());
    }

    if (_coursesNextPageUrl == null &&
        currentState.courses != null &&
        !isNewFilter) {
      return; // Reached max
    }

    final result = await _coursesUsecase(
      url: _coursesNextPageUrl,
      order: _courseOrdering,
      search: _courseSearch,
    );

    result.fold((failure) => emit(CourseState.error(failure)), (paginatedData) {
      _coursesNextPageUrl = paginatedData.next;
      final newCourses = paginatedData.results ?? [];
      final allCourses =
          isNewFilter
              ? newCourses
              : <CourseEntity>[...currentState.courses ?? [], ...newCourses];
      emit(
        currentState.copyWith(
          courses: allCourses,
          hasReachedMaxCourses: _coursesNextPageUrl == null,
        ),
      );
    });
  }
}

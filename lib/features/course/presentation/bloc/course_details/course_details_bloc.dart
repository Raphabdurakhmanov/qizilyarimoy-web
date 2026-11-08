import 'package:app/core/error/failure.dart';
import 'package:app/features/course/domain/entities/course_entity.dart';
import 'package:app/features/course/domain/entities/lesson_entity.dart';
import 'package:app/features/course/domain/entities/module_entity.dart';
import 'package:app/features/course/domain/usecases/course_details_usecase.dart';
import 'package:app/features/course/domain/usecases/enroll_course_usecase.dart';
import 'package:app/features/course/domain/usecases/fetch_comments_usecase.dart';
import 'package:app/features/course/domain/usecases/like_to_comment_usecase.dart';
import 'package:app/features/course/domain/usecases/modules_usecase.dart';
import 'package:app/features/course/domain/usecases/send_comment_usecase.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';
part 'course_details_bloc.freezed.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  final CourseDetailsUsecase _courseDetailUsecase;
  final ModulesUsecase _modulesUsecase;
  final FetchCommentsUsecase _fetchCommentsUsecase;
  final SendCommentUsecase _sendCommentUsecase;
  final LikeToCommentUsecase _likeToCommentUsecase;
  final EnrollCourseUseCase _enrollCourseUseCase;
  int? _currentModulesCourseId;
  String? _modulesNextPageUrl;

  CourseDetailsBloc({
    required ModulesUsecase modulesUsecase,
    required FetchCommentsUsecase fetchCommentsUsecase,
    required SendCommentUsecase sendCommentUsecase,
    required LikeToCommentUsecase likeToCommentUsecase,
    required EnrollCourseUseCase enrollCourseUseCase,
    required CourseDetailsUsecase courseDetailsUsecase,
  }) : _modulesUsecase = modulesUsecase,
       _fetchCommentsUsecase = fetchCommentsUsecase,
       _sendCommentUsecase = sendCommentUsecase,
       _likeToCommentUsecase = likeToCommentUsecase,
       _courseDetailUsecase = courseDetailsUsecase,
       _enrollCourseUseCase = enrollCourseUseCase,
       super(const CourseDetailsState.initial()) {
    on<CourseDetailsEvent>((event, emit) async {
      await event.map(
        fetchCourseModules: (event) => _onFetchCourseModules(event, emit),
        fetchComments: (event) => _onFetchComments(event, emit),
        sendComment: (event) => _onSendComment(event, emit),
        likeComment: (event) => _onLikeComment(event, emit),
        getCourseDetails: (event) => _onFetchCourseDetails(event, emit),
        completeLesson: (_CompleteLesson value) async {
          currentState.modules?.forEach((element) {
            if (element.lessons != null) {
              for (var lesson in element.lessons!) {
                if (lesson.id == value.lesson.id) {
                  lesson.isCompleted.value = true;
                }
              }
            }
          });
        },
        enrollCourse: (_EnrollCourse value) async {
          emit(CourseDetailsState.loading());
          final result = await _enrollCourseUseCase(value.courseId);
          result.fold((failure) => emit(CourseDetailsState.error(failure)), (
            lesson,
          ) {
            emit(CourseDetailsState.loaded(activeLesson: lesson));
          });
        },
      );
    }, transformer: throttleDroppable(throttleDuration));
  }
  Future<void> _onFetchCourseDetails(
    _GetCourseDetails event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseDetailsState.loading());
    final result = await _courseDetailUsecase(event.courseId);
    result.fold((failure) => emit(CourseDetailsState.error(failure)), (
      courseDetails,
    ) {
      emit(currentState.copyWith(courseDetails: courseDetails));
    });
  }

  _Loaded get currentState =>
      state.maybeMap(loaded: (s) => s, orElse: () => const _Loaded());

  Future<void> _onFetchCourseModules(
    _FetchCourseModules event,
    Emitter<CourseDetailsState> emit,
  ) async {
    final isNewCourse = event.courseId != _currentModulesCourseId;
    if (isNewCourse) {
      _modulesNextPageUrl = null;
      _currentModulesCourseId = event.courseId;
      emit(currentState.copyWith(modules: []));
      emit(CourseDetailsState.loading());
    }

    if (_modulesNextPageUrl == null &&
        currentState.modules != null &&
        !isNewCourse) {
      return; // Reached max
    }

    final result = await _modulesUsecase(
      id: event.courseId,
      url: _modulesNextPageUrl,
    );

    result.fold((failure) => emit(CourseDetailsState.error(failure)), (
      paginatedData,
    ) {
      _modulesNextPageUrl = paginatedData.next;
      final newModules = paginatedData.results ?? [];
      final List<ModuleEntity> allModules =
          isNewCourse
              ? newModules
              : <ModuleEntity>[...currentState.modules ?? [], ...newModules];
      emit(
        currentState.copyWith(
          modules: allModules,
          hasReachedMaxModules: _modulesNextPageUrl == null,
        ),
      );
    });
  }

  Future<void> _onFetchComments(
    _FetchComments event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseDetailsState.loading());
    final result = await _fetchCommentsUsecase(event.courseId);
    result.fold(
      (failure) {
        emit(CourseDetailsState.error(failure));
      },
      (comments) {
        emit(CourseDetailsState.loadedComments(comments: comments));
      },
    );
  }

  Future<void> _onSendComment(
    _SendComment event,
    Emitter<CourseDetailsState> emit,
  ) async {
    final result = await _sendCommentUsecase(
      courseId: event.courseId,
      text: event.text,
      parent: event.parent,
    );

    result.fold(
      (failure) {
        emit(CourseDetailsState.error(failure));
      },
      (newComment) {
        emit(CourseDetailsState.loaded(isPostingComment: true));
      },
    );
  }

  Future<void> _onLikeComment(
    _LikeComment event,
    Emitter<CourseDetailsState> emit,
  ) async {
    await _likeToCommentUsecase(event.commentId);
  }
}

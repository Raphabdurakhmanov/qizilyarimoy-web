part of 'course_details_bloc.dart';

@freezed
class CourseDetailsState with _$CourseDetailsState {
  const factory CourseDetailsState.initial() = _Initial;
  const factory CourseDetailsState.loading() = _Loading;
  const factory CourseDetailsState.error(Failure failure) = _Error;

  // A single 'Loaded' state to hold all data
  const factory CourseDetailsState.loaded({
    List<ModuleEntity>? modules,
    bool? hasReachedMaxModules,
    CourseEntity? courseDetails,
    LessonEntity? activeLesson,
    @Default(false) bool isPostingComment,
  }) = _Loaded;

  const factory CourseDetailsState.loadedComments({
    List<CommentEntity>? comments,
    @Default(false) bool isPostingComment,
  }) = _LoadedComments;
}

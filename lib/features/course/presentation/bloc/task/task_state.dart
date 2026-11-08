part of 'task_bloc.dart';

@freezed
sealed class TaskState with _$TaskState {
  const factory TaskState.initial() = _Initial;
  const factory TaskState.loading() = _Loading;
  const factory TaskState.loaded(List<TaskEntity> tasks, int lessonId) =
      _Loaded;
  const factory TaskState.downloading(TaskFileEntity taskFile) = _Downloading;
  const factory TaskState.error(Failure failure) = _Error;
}

part of 'task_bloc.dart';

@freezed
sealed class TaskEvent with _$TaskEvent {
  const factory TaskEvent.fetchTasks({required int lessonId}) = _FetchTasks;
  const factory TaskEvent.downloadFile({required TaskFileEntity file}) =
      _DownloadFile;
  const factory TaskEvent.retryDownload({required TaskFileEntity file}) =
      _RetryDownload;
  const factory TaskEvent.updateDownloadStatus(
    String id,
    int status,
    int progress,
  ) = _UpdateDownloadStatus;
}

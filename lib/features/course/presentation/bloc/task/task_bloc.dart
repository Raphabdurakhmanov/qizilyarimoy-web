import 'package:app/core/error/failure.dart';
import 'package:app/config/services/download_service.dart';
import 'package:app/features/course/domain/entities/task_entity.dart';
import 'package:app/features/course/domain/usecases/fetch_task_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FetchTaskUseCase _fetchTaskUseCase;

  List<TaskEntity> _tasks = [];
  int _lessonId = 0;

  TaskBloc(this._fetchTaskUseCase) : super(const TaskState.initial()) {
    on<_FetchTasks>(_onFetchTasks);
    on<_DownloadFile>(_onDownloadFile);
    on<_RetryDownload>(_onRetryDownload);
    on<_UpdateDownloadStatus>(_onUpdateDownloadStatus);
  }

  Future<void> _onFetchTasks(_FetchTasks event, Emitter<TaskState> emit) async {
    emit(const TaskState.loading());
    final failureOrTasks = await _fetchTaskUseCase(event.lessonId);
    failureOrTasks.fold(
      (failure) {
        emit(TaskState.error(failure));
      },
      (tasks) {
        _tasks = tasks;
        _lessonId = event.lessonId;
        emit(TaskState.loaded(_tasks, _lessonId));
      },
    );
  }

  /// Opens the file in the browser / external app (works on web and mobile).
  Future<void> _onDownloadFile(
    _DownloadFile event,
    Emitter<TaskState> emit,
  ) async {
    final ok = await DownloadService.openFile(event.file.url);
    event.file.taskId.value = event.file.url;
    event.file.progress.value = ok ? 100 : 0;
    event.file.isDownloaded.value = ok;
    event.file.filePath.value = ok ? event.file.url : '';
    event.file.status.value =
        ok
            ? DownloadTaskStatus.complete.index
            : DownloadTaskStatus.failed.index;
    emit(TaskState.loaded(_tasks, _lessonId));
  }

  Future<void> _onRetryDownload(
    _RetryDownload event,
    Emitter<TaskState> emit,
  ) async {
    add(TaskEvent.downloadFile(file: event.file));
  }

  Future<void> _onUpdateDownloadStatus(
    _UpdateDownloadStatus event,
    Emitter<TaskState> emit,
  ) async {
    final file = _findFileByTaskId(event.id);
    if (file != null) {
      file.status.value = event.status;
      file.progress.value = event.progress.toDouble();
      emit(TaskState.loaded(_tasks, _lessonId));
    }
  }

  TaskFileEntity? _findFileByTaskId(String taskId) {
    for (final t in _tasks) {
      for (final f in t.files) {
        if (f.taskId.value == taskId) return f;
      }
    }
    return null;
  }
}

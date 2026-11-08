import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TaskEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final int order;
  final List<TaskFileEntity> files;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
    required this.files,
  });

  @override
  List<Object?> get props => [id, title, description, order, files];

  TaskEntity copyWith({
    int? id,
    String? title,
    String? description,
    int? order,
    List<TaskFileEntity>? files,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      order: order ?? this.order,
      files: files ?? this.files,
    );
  }
}

class TaskFileEntity extends Equatable {
  final int id;
  final String name;
  final String url;
  final ValueNotifier<String?> filePath;
  final ValueNotifier<bool?> isDownloaded;
  final ValueNotifier<double?> progress;
  final ValueNotifier<int> status;
  final ValueNotifier<String> taskId;

  const TaskFileEntity({
    required this.id,
    required this.name,
    required this.url,
    required this.filePath,
    required this.isDownloaded,
    required this.progress,
    required this.status, // 0: pending, 1: downloading, 2: completed, 3: failed
    required this.taskId,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    url,
    filePath.value,
    isDownloaded.value,
    progress.value,
    status.value,
    taskId.value,
  ];

  TaskFileEntity copyWith({
    int? id,
    String? name,
    String? url,
    ValueNotifier<String?>? filePath,
    ValueNotifier<bool?>? isDownloaded,
    ValueNotifier<double?>? progress,
    ValueNotifier<int>? status,
    ValueNotifier<String>? taskId,
  }) {
    return TaskFileEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      filePath: filePath ?? this.filePath,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      taskId: taskId ?? this.taskId,
    );
  }
}

import 'package:app/features/course/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    required super.title,
    required super.description,
    required super.order,
    required super.files,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      order: json['order'],
      files:
          (json['files'] as List)
              .map((e) => TaskFileModel.fromJson(e))
              .toList(),
    );
  }
}

class TaskFileModel extends TaskFileEntity {
  const TaskFileModel({
    required super.id,
    required super.name,
    required super.url,
    required super.filePath,
    required super.isDownloaded,
    required super.progress,
    required super.status,
    required super.taskId,
  });

  factory TaskFileModel.fromJson(Map<String, dynamic> json) {
    return TaskFileModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      filePath: ValueNotifier<String?>(null),
      isDownloaded: ValueNotifier<bool?>(null),
      progress: ValueNotifier<double?>(0.0),
      status: ValueNotifier<int>(0),
      taskId: ValueNotifier<String>(""),
    );
  }
}

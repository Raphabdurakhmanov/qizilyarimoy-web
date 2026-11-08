import 'package:app/core/error/failure.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/features/course/data/data_sources/task_remote_data_source.dart';
import 'package:app/features/course/domain/entities/task_entity.dart';
import 'package:app/features/course/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app/config/services/download_service.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskRemoteDataSource dataSource;
  final NetworkInfo networkInfo;
  TaskRepositoryImpl({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchTasks(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await dataSource.fetchTasks(id);
        final updated =
            res.map((task) {
              final files =
                  task.files.map((file) {
                    return file.copyWith(
                      filePath: ValueNotifier<String?>(''),
                      isDownloaded: ValueNotifier<bool?>(false),
                      progress: ValueNotifier<double?>(0.0),
                      status: ValueNotifier<int>(
                        DownloadTaskStatus.undefined.index,
                      ),
                      taskId: ValueNotifier<String>(''),
                    );
                  }).toList();

              return task.copyWith(files: files);
            }).toList();

        return Right(updated);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure("no_internet_connection".tr()));
    }
  }
}

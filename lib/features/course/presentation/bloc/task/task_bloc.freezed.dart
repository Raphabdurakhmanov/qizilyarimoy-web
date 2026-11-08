// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskEvent()';
}


}

/// @nodoc
class $TaskEventCopyWith<$Res>  {
$TaskEventCopyWith(TaskEvent _, $Res Function(TaskEvent) __);
}


/// Adds pattern-matching-related methods to [TaskEvent].
extension TaskEventPatterns on TaskEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchTasks value)?  fetchTasks,TResult Function( _DownloadFile value)?  downloadFile,TResult Function( _RetryDownload value)?  retryDownload,TResult Function( _UpdateDownloadStatus value)?  updateDownloadStatus,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchTasks() when fetchTasks != null:
return fetchTasks(_that);case _DownloadFile() when downloadFile != null:
return downloadFile(_that);case _RetryDownload() when retryDownload != null:
return retryDownload(_that);case _UpdateDownloadStatus() when updateDownloadStatus != null:
return updateDownloadStatus(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchTasks value)  fetchTasks,required TResult Function( _DownloadFile value)  downloadFile,required TResult Function( _RetryDownload value)  retryDownload,required TResult Function( _UpdateDownloadStatus value)  updateDownloadStatus,}){
final _that = this;
switch (_that) {
case _FetchTasks():
return fetchTasks(_that);case _DownloadFile():
return downloadFile(_that);case _RetryDownload():
return retryDownload(_that);case _UpdateDownloadStatus():
return updateDownloadStatus(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchTasks value)?  fetchTasks,TResult? Function( _DownloadFile value)?  downloadFile,TResult? Function( _RetryDownload value)?  retryDownload,TResult? Function( _UpdateDownloadStatus value)?  updateDownloadStatus,}){
final _that = this;
switch (_that) {
case _FetchTasks() when fetchTasks != null:
return fetchTasks(_that);case _DownloadFile() when downloadFile != null:
return downloadFile(_that);case _RetryDownload() when retryDownload != null:
return retryDownload(_that);case _UpdateDownloadStatus() when updateDownloadStatus != null:
return updateDownloadStatus(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int lessonId)?  fetchTasks,TResult Function( TaskFileEntity file)?  downloadFile,TResult Function( TaskFileEntity file)?  retryDownload,TResult Function( String id,  int status,  int progress)?  updateDownloadStatus,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchTasks() when fetchTasks != null:
return fetchTasks(_that.lessonId);case _DownloadFile() when downloadFile != null:
return downloadFile(_that.file);case _RetryDownload() when retryDownload != null:
return retryDownload(_that.file);case _UpdateDownloadStatus() when updateDownloadStatus != null:
return updateDownloadStatus(_that.id,_that.status,_that.progress);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int lessonId)  fetchTasks,required TResult Function( TaskFileEntity file)  downloadFile,required TResult Function( TaskFileEntity file)  retryDownload,required TResult Function( String id,  int status,  int progress)  updateDownloadStatus,}) {final _that = this;
switch (_that) {
case _FetchTasks():
return fetchTasks(_that.lessonId);case _DownloadFile():
return downloadFile(_that.file);case _RetryDownload():
return retryDownload(_that.file);case _UpdateDownloadStatus():
return updateDownloadStatus(_that.id,_that.status,_that.progress);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int lessonId)?  fetchTasks,TResult? Function( TaskFileEntity file)?  downloadFile,TResult? Function( TaskFileEntity file)?  retryDownload,TResult? Function( String id,  int status,  int progress)?  updateDownloadStatus,}) {final _that = this;
switch (_that) {
case _FetchTasks() when fetchTasks != null:
return fetchTasks(_that.lessonId);case _DownloadFile() when downloadFile != null:
return downloadFile(_that.file);case _RetryDownload() when retryDownload != null:
return retryDownload(_that.file);case _UpdateDownloadStatus() when updateDownloadStatus != null:
return updateDownloadStatus(_that.id,_that.status,_that.progress);case _:
  return null;

}
}

}

/// @nodoc


class _FetchTasks with DiagnosticableTreeMixin implements TaskEvent {
  const _FetchTasks({required this.lessonId});
  

 final  int lessonId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchTasksCopyWith<_FetchTasks> get copyWith => __$FetchTasksCopyWithImpl<_FetchTasks>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskEvent.fetchTasks'))
    ..add(DiagnosticsProperty('lessonId', lessonId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTasks&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId));
}


@override
int get hashCode => Object.hash(runtimeType,lessonId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskEvent.fetchTasks(lessonId: $lessonId)';
}


}

/// @nodoc
abstract mixin class _$FetchTasksCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$FetchTasksCopyWith(_FetchTasks value, $Res Function(_FetchTasks) _then) = __$FetchTasksCopyWithImpl;
@useResult
$Res call({
 int lessonId
});




}
/// @nodoc
class __$FetchTasksCopyWithImpl<$Res>
    implements _$FetchTasksCopyWith<$Res> {
  __$FetchTasksCopyWithImpl(this._self, this._then);

  final _FetchTasks _self;
  final $Res Function(_FetchTasks) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lessonId = null,}) {
  return _then(_FetchTasks(
lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DownloadFile with DiagnosticableTreeMixin implements TaskEvent {
  const _DownloadFile({required this.file});
  

 final  TaskFileEntity file;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadFileCopyWith<_DownloadFile> get copyWith => __$DownloadFileCopyWithImpl<_DownloadFile>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskEvent.downloadFile'))
    ..add(DiagnosticsProperty('file', file));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadFile&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskEvent.downloadFile(file: $file)';
}


}

/// @nodoc
abstract mixin class _$DownloadFileCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$DownloadFileCopyWith(_DownloadFile value, $Res Function(_DownloadFile) _then) = __$DownloadFileCopyWithImpl;
@useResult
$Res call({
 TaskFileEntity file
});




}
/// @nodoc
class __$DownloadFileCopyWithImpl<$Res>
    implements _$DownloadFileCopyWith<$Res> {
  __$DownloadFileCopyWithImpl(this._self, this._then);

  final _DownloadFile _self;
  final $Res Function(_DownloadFile) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(_DownloadFile(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as TaskFileEntity,
  ));
}


}

/// @nodoc


class _RetryDownload with DiagnosticableTreeMixin implements TaskEvent {
  const _RetryDownload({required this.file});
  

 final  TaskFileEntity file;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetryDownloadCopyWith<_RetryDownload> get copyWith => __$RetryDownloadCopyWithImpl<_RetryDownload>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskEvent.retryDownload'))
    ..add(DiagnosticsProperty('file', file));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryDownload&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskEvent.retryDownload(file: $file)';
}


}

/// @nodoc
abstract mixin class _$RetryDownloadCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$RetryDownloadCopyWith(_RetryDownload value, $Res Function(_RetryDownload) _then) = __$RetryDownloadCopyWithImpl;
@useResult
$Res call({
 TaskFileEntity file
});




}
/// @nodoc
class __$RetryDownloadCopyWithImpl<$Res>
    implements _$RetryDownloadCopyWith<$Res> {
  __$RetryDownloadCopyWithImpl(this._self, this._then);

  final _RetryDownload _self;
  final $Res Function(_RetryDownload) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(_RetryDownload(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as TaskFileEntity,
  ));
}


}

/// @nodoc


class _UpdateDownloadStatus with DiagnosticableTreeMixin implements TaskEvent {
  const _UpdateDownloadStatus(this.id, this.status, this.progress);
  

 final  String id;
 final  int status;
 final  int progress;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDownloadStatusCopyWith<_UpdateDownloadStatus> get copyWith => __$UpdateDownloadStatusCopyWithImpl<_UpdateDownloadStatus>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskEvent.updateDownloadStatus'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('progress', progress));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDownloadStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,id,status,progress);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskEvent.updateDownloadStatus(id: $id, status: $status, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$UpdateDownloadStatusCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$UpdateDownloadStatusCopyWith(_UpdateDownloadStatus value, $Res Function(_UpdateDownloadStatus) _then) = __$UpdateDownloadStatusCopyWithImpl;
@useResult
$Res call({
 String id, int status, int progress
});




}
/// @nodoc
class __$UpdateDownloadStatusCopyWithImpl<$Res>
    implements _$UpdateDownloadStatusCopyWith<$Res> {
  __$UpdateDownloadStatusCopyWithImpl(this._self, this._then);

  final _UpdateDownloadStatus _self;
  final $Res Function(_UpdateDownloadStatus) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? progress = null,}) {
  return _then(_UpdateDownloadStatus(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TaskState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskState()';
}


}

/// @nodoc
class $TaskStateCopyWith<$Res>  {
$TaskStateCopyWith(TaskState _, $Res Function(TaskState) __);
}


/// Adds pattern-matching-related methods to [TaskState].
extension TaskStatePatterns on TaskState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Downloading value)?  downloading,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Downloading() when downloading != null:
return downloading(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Downloading value)  downloading,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Downloading():
return downloading(_that);case _Error():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Downloading value)?  downloading,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Downloading() when downloading != null:
return downloading(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TaskEntity> tasks,  int lessonId)?  loaded,TResult Function( TaskFileEntity taskFile)?  downloading,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.tasks,_that.lessonId);case _Downloading() when downloading != null:
return downloading(_that.taskFile);case _Error() when error != null:
return error(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TaskEntity> tasks,  int lessonId)  loaded,required TResult Function( TaskFileEntity taskFile)  downloading,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.tasks,_that.lessonId);case _Downloading():
return downloading(_that.taskFile);case _Error():
return error(_that.failure);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TaskEntity> tasks,  int lessonId)?  loaded,TResult? Function( TaskFileEntity taskFile)?  downloading,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.tasks,_that.lessonId);case _Downloading() when downloading != null:
return downloading(_that.taskFile);case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial with DiagnosticableTreeMixin implements TaskState {
  const _Initial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskState.initial()';
}


}




/// @nodoc


class _Loading with DiagnosticableTreeMixin implements TaskState {
  const _Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskState.loading()';
}


}




/// @nodoc


class _Loaded with DiagnosticableTreeMixin implements TaskState {
  const _Loaded(final  List<TaskEntity> tasks, this.lessonId): _tasks = tasks;
  

 final  List<TaskEntity> _tasks;
 List<TaskEntity> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

 final  int lessonId;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskState.loaded'))
    ..add(DiagnosticsProperty('tasks', tasks))..add(DiagnosticsProperty('lessonId', lessonId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks),lessonId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskState.loaded(tasks: $tasks, lessonId: $lessonId)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<TaskEntity> tasks, int lessonId
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,Object? lessonId = null,}) {
  return _then(_Loaded(
null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Downloading with DiagnosticableTreeMixin implements TaskState {
  const _Downloading(this.taskFile);
  

 final  TaskFileEntity taskFile;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadingCopyWith<_Downloading> get copyWith => __$DownloadingCopyWithImpl<_Downloading>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskState.downloading'))
    ..add(DiagnosticsProperty('taskFile', taskFile));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Downloading&&(identical(other.taskFile, taskFile) || other.taskFile == taskFile));
}


@override
int get hashCode => Object.hash(runtimeType,taskFile);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskState.downloading(taskFile: $taskFile)';
}


}

/// @nodoc
abstract mixin class _$DownloadingCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory _$DownloadingCopyWith(_Downloading value, $Res Function(_Downloading) _then) = __$DownloadingCopyWithImpl;
@useResult
$Res call({
 TaskFileEntity taskFile
});




}
/// @nodoc
class __$DownloadingCopyWithImpl<$Res>
    implements _$DownloadingCopyWith<$Res> {
  __$DownloadingCopyWithImpl(this._self, this._then);

  final _Downloading _self;
  final $Res Function(_Downloading) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskFile = null,}) {
  return _then(_Downloading(
null == taskFile ? _self.taskFile : taskFile // ignore: cast_nullable_to_non_nullable
as TaskFileEntity,
  ));
}


}

/// @nodoc


class _Error with DiagnosticableTreeMixin implements TaskState {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskState.error'))
    ..add(DiagnosticsProperty('failure', failure));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on

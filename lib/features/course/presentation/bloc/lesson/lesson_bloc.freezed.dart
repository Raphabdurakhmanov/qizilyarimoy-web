// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonEvent {

 int get courseId;
/// Create a copy of LessonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonEventCopyWith<LessonEvent> get copyWith => _$LessonEventCopyWithImpl<LessonEvent>(this as LessonEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonEvent&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId);

@override
String toString() {
  return 'LessonEvent(courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class $LessonEventCopyWith<$Res>  {
  factory $LessonEventCopyWith(LessonEvent value, $Res Function(LessonEvent) _then) = _$LessonEventCopyWithImpl;
@useResult
$Res call({
 int courseId
});




}
/// @nodoc
class _$LessonEventCopyWithImpl<$Res>
    implements $LessonEventCopyWith<$Res> {
  _$LessonEventCopyWithImpl(this._self, this._then);

  final LessonEvent _self;
  final $Res Function(LessonEvent) _then;

/// Create a copy of LessonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? courseId = null,}) {
  return _then(_self.copyWith(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonEvent].
extension LessonEventPatterns on LessonEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ActiveLesson value)?  activeLesson,TResult Function( _NextLesson value)?  nextLesson,TResult Function( _PreviousLesson value)?  previousLesson,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveLesson() when activeLesson != null:
return activeLesson(_that);case _NextLesson() when nextLesson != null:
return nextLesson(_that);case _PreviousLesson() when previousLesson != null:
return previousLesson(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ActiveLesson value)  activeLesson,required TResult Function( _NextLesson value)  nextLesson,required TResult Function( _PreviousLesson value)  previousLesson,}){
final _that = this;
switch (_that) {
case _ActiveLesson():
return activeLesson(_that);case _NextLesson():
return nextLesson(_that);case _PreviousLesson():
return previousLesson(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ActiveLesson value)?  activeLesson,TResult? Function( _NextLesson value)?  nextLesson,TResult? Function( _PreviousLesson value)?  previousLesson,}){
final _that = this;
switch (_that) {
case _ActiveLesson() when activeLesson != null:
return activeLesson(_that);case _NextLesson() when nextLesson != null:
return nextLesson(_that);case _PreviousLesson() when previousLesson != null:
return previousLesson(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int courseId)?  activeLesson,TResult Function( int courseId,  int lessonId)?  nextLesson,TResult Function( int courseId,  int lessonId)?  previousLesson,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveLesson() when activeLesson != null:
return activeLesson(_that.courseId);case _NextLesson() when nextLesson != null:
return nextLesson(_that.courseId,_that.lessonId);case _PreviousLesson() when previousLesson != null:
return previousLesson(_that.courseId,_that.lessonId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int courseId)  activeLesson,required TResult Function( int courseId,  int lessonId)  nextLesson,required TResult Function( int courseId,  int lessonId)  previousLesson,}) {final _that = this;
switch (_that) {
case _ActiveLesson():
return activeLesson(_that.courseId);case _NextLesson():
return nextLesson(_that.courseId,_that.lessonId);case _PreviousLesson():
return previousLesson(_that.courseId,_that.lessonId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int courseId)?  activeLesson,TResult? Function( int courseId,  int lessonId)?  nextLesson,TResult? Function( int courseId,  int lessonId)?  previousLesson,}) {final _that = this;
switch (_that) {
case _ActiveLesson() when activeLesson != null:
return activeLesson(_that.courseId);case _NextLesson() when nextLesson != null:
return nextLesson(_that.courseId,_that.lessonId);case _PreviousLesson() when previousLesson != null:
return previousLesson(_that.courseId,_that.lessonId);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveLesson implements LessonEvent {
  const _ActiveLesson(this.courseId);
  

@override final  int courseId;

/// Create a copy of LessonEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveLessonCopyWith<_ActiveLesson> get copyWith => __$ActiveLessonCopyWithImpl<_ActiveLesson>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveLesson&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId);

@override
String toString() {
  return 'LessonEvent.activeLesson(courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$ActiveLessonCopyWith<$Res> implements $LessonEventCopyWith<$Res> {
  factory _$ActiveLessonCopyWith(_ActiveLesson value, $Res Function(_ActiveLesson) _then) = __$ActiveLessonCopyWithImpl;
@override @useResult
$Res call({
 int courseId
});




}
/// @nodoc
class __$ActiveLessonCopyWithImpl<$Res>
    implements _$ActiveLessonCopyWith<$Res> {
  __$ActiveLessonCopyWithImpl(this._self, this._then);

  final _ActiveLesson _self;
  final $Res Function(_ActiveLesson) _then;

/// Create a copy of LessonEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courseId = null,}) {
  return _then(_ActiveLesson(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _NextLesson implements LessonEvent {
  const _NextLesson(this.courseId, this.lessonId);
  

@override final  int courseId;
 final  int lessonId;

/// Create a copy of LessonEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextLessonCopyWith<_NextLesson> get copyWith => __$NextLessonCopyWithImpl<_NextLesson>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextLesson&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId,lessonId);

@override
String toString() {
  return 'LessonEvent.nextLesson(courseId: $courseId, lessonId: $lessonId)';
}


}

/// @nodoc
abstract mixin class _$NextLessonCopyWith<$Res> implements $LessonEventCopyWith<$Res> {
  factory _$NextLessonCopyWith(_NextLesson value, $Res Function(_NextLesson) _then) = __$NextLessonCopyWithImpl;
@override @useResult
$Res call({
 int courseId, int lessonId
});




}
/// @nodoc
class __$NextLessonCopyWithImpl<$Res>
    implements _$NextLessonCopyWith<$Res> {
  __$NextLessonCopyWithImpl(this._self, this._then);

  final _NextLesson _self;
  final $Res Function(_NextLesson) _then;

/// Create a copy of LessonEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courseId = null,Object? lessonId = null,}) {
  return _then(_NextLesson(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _PreviousLesson implements LessonEvent {
  const _PreviousLesson(this.courseId, this.lessonId);
  

@override final  int courseId;
 final  int lessonId;

/// Create a copy of LessonEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviousLessonCopyWith<_PreviousLesson> get copyWith => __$PreviousLessonCopyWithImpl<_PreviousLesson>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviousLesson&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId,lessonId);

@override
String toString() {
  return 'LessonEvent.previousLesson(courseId: $courseId, lessonId: $lessonId)';
}


}

/// @nodoc
abstract mixin class _$PreviousLessonCopyWith<$Res> implements $LessonEventCopyWith<$Res> {
  factory _$PreviousLessonCopyWith(_PreviousLesson value, $Res Function(_PreviousLesson) _then) = __$PreviousLessonCopyWithImpl;
@override @useResult
$Res call({
 int courseId, int lessonId
});




}
/// @nodoc
class __$PreviousLessonCopyWithImpl<$Res>
    implements _$PreviousLessonCopyWith<$Res> {
  __$PreviousLessonCopyWithImpl(this._self, this._then);

  final _PreviousLesson _self;
  final $Res Function(_PreviousLesson) _then;

/// Create a copy of LessonEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courseId = null,Object? lessonId = null,}) {
  return _then(_PreviousLesson(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$LessonState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LessonState()';
}


}

/// @nodoc
class $LessonStateCopyWith<$Res>  {
$LessonStateCopyWith(LessonState _, $Res Function(LessonState) __);
}


/// Adds pattern-matching-related methods to [LessonState].
extension LessonStatePatterns on LessonState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( LessonEntity lesson)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.lesson);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( LessonEntity lesson)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.lesson);case _Error():
return error(_that.failure);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( LessonEntity lesson)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.lesson);case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LessonState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LessonState.initial()';
}


}




/// @nodoc


class _Loading implements LessonState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LessonState.loading()';
}


}




/// @nodoc


class _Loaded implements LessonState {
  const _Loaded(this.lesson);
  

 final  LessonEntity lesson;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.lesson, lesson) || other.lesson == lesson));
}


@override
int get hashCode => Object.hash(runtimeType,lesson);

@override
String toString() {
  return 'LessonState.loaded(lesson: $lesson)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $LessonStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 LessonEntity lesson
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lesson = null,}) {
  return _then(_Loaded(
null == lesson ? _self.lesson : lesson // ignore: cast_nullable_to_non_nullable
as LessonEntity,
  ));
}


}

/// @nodoc


class _Error implements LessonState {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'LessonState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $LessonStateCopyWith<$Res> {
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

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on

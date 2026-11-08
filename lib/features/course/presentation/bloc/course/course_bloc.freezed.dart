// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseEvent()';
}


}

/// @nodoc
class $CourseEventCopyWith<$Res>  {
$CourseEventCopyWith(CourseEvent _, $Res Function(CourseEvent) __);
}


/// Adds pattern-matching-related methods to [CourseEvent].
extension CourseEventPatterns on CourseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchCourses value)?  fetchCourses,TResult Function( _ChangeActiveLesson value)?  changeActiveLesson,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCourses() when fetchCourses != null:
return fetchCourses(_that);case _ChangeActiveLesson() when changeActiveLesson != null:
return changeActiveLesson(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchCourses value)  fetchCourses,required TResult Function( _ChangeActiveLesson value)  changeActiveLesson,}){
final _that = this;
switch (_that) {
case _FetchCourses():
return fetchCourses(_that);case _ChangeActiveLesson():
return changeActiveLesson(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchCourses value)?  fetchCourses,TResult? Function( _ChangeActiveLesson value)?  changeActiveLesson,}){
final _that = this;
switch (_that) {
case _FetchCourses() when fetchCourses != null:
return fetchCourses(_that);case _ChangeActiveLesson() when changeActiveLesson != null:
return changeActiveLesson(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? order,  String? search)?  fetchCourses,TResult Function( LessonEntity activeLesson,  int courseId)?  changeActiveLesson,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCourses() when fetchCourses != null:
return fetchCourses(_that.order,_that.search);case _ChangeActiveLesson() when changeActiveLesson != null:
return changeActiveLesson(_that.activeLesson,_that.courseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? order,  String? search)  fetchCourses,required TResult Function( LessonEntity activeLesson,  int courseId)  changeActiveLesson,}) {final _that = this;
switch (_that) {
case _FetchCourses():
return fetchCourses(_that.order,_that.search);case _ChangeActiveLesson():
return changeActiveLesson(_that.activeLesson,_that.courseId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? order,  String? search)?  fetchCourses,TResult? Function( LessonEntity activeLesson,  int courseId)?  changeActiveLesson,}) {final _that = this;
switch (_that) {
case _FetchCourses() when fetchCourses != null:
return fetchCourses(_that.order,_that.search);case _ChangeActiveLesson() when changeActiveLesson != null:
return changeActiveLesson(_that.activeLesson,_that.courseId);case _:
  return null;

}
}

}

/// @nodoc


class _FetchCourses implements CourseEvent {
  const _FetchCourses({this.order, this.search});
  

 final  String? order;
 final  String? search;

/// Create a copy of CourseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCoursesCopyWith<_FetchCourses> get copyWith => __$FetchCoursesCopyWithImpl<_FetchCourses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCourses&&(identical(other.order, order) || other.order == order)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,order,search);

@override
String toString() {
  return 'CourseEvent.fetchCourses(order: $order, search: $search)';
}


}

/// @nodoc
abstract mixin class _$FetchCoursesCopyWith<$Res> implements $CourseEventCopyWith<$Res> {
  factory _$FetchCoursesCopyWith(_FetchCourses value, $Res Function(_FetchCourses) _then) = __$FetchCoursesCopyWithImpl;
@useResult
$Res call({
 String? order, String? search
});




}
/// @nodoc
class __$FetchCoursesCopyWithImpl<$Res>
    implements _$FetchCoursesCopyWith<$Res> {
  __$FetchCoursesCopyWithImpl(this._self, this._then);

  final _FetchCourses _self;
  final $Res Function(_FetchCourses) _then;

/// Create a copy of CourseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = freezed,Object? search = freezed,}) {
  return _then(_FetchCourses(
order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ChangeActiveLesson implements CourseEvent {
  const _ChangeActiveLesson(this.activeLesson, this.courseId);
  

 final  LessonEntity activeLesson;
 final  int courseId;

/// Create a copy of CourseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeActiveLessonCopyWith<_ChangeActiveLesson> get copyWith => __$ChangeActiveLessonCopyWithImpl<_ChangeActiveLesson>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeActiveLesson&&(identical(other.activeLesson, activeLesson) || other.activeLesson == activeLesson)&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,activeLesson,courseId);

@override
String toString() {
  return 'CourseEvent.changeActiveLesson(activeLesson: $activeLesson, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$ChangeActiveLessonCopyWith<$Res> implements $CourseEventCopyWith<$Res> {
  factory _$ChangeActiveLessonCopyWith(_ChangeActiveLesson value, $Res Function(_ChangeActiveLesson) _then) = __$ChangeActiveLessonCopyWithImpl;
@useResult
$Res call({
 LessonEntity activeLesson, int courseId
});




}
/// @nodoc
class __$ChangeActiveLessonCopyWithImpl<$Res>
    implements _$ChangeActiveLessonCopyWith<$Res> {
  __$ChangeActiveLessonCopyWithImpl(this._self, this._then);

  final _ChangeActiveLesson _self;
  final $Res Function(_ChangeActiveLesson) _then;

/// Create a copy of CourseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? activeLesson = null,Object? courseId = null,}) {
  return _then(_ChangeActiveLesson(
null == activeLesson ? _self.activeLesson : activeLesson // ignore: cast_nullable_to_non_nullable
as LessonEntity,null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CourseState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseState()';
}


}

/// @nodoc
class $CourseStateCopyWith<$Res>  {
$CourseStateCopyWith(CourseState _, $Res Function(CourseState) __);
}


/// Adds pattern-matching-related methods to [CourseState].
extension CourseStatePatterns on CourseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Failure failure)?  error,TResult Function( List<CourseEntity>? courses,  bool? hasReachedMaxCourses)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.failure);case _Loaded() when loaded != null:
return loaded(_that.courses,_that.hasReachedMaxCourses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Failure failure)  error,required TResult Function( List<CourseEntity>? courses,  bool? hasReachedMaxCourses)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Error():
return error(_that.failure);case _Loaded():
return loaded(_that.courses,_that.hasReachedMaxCourses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Failure failure)?  error,TResult? Function( List<CourseEntity>? courses,  bool? hasReachedMaxCourses)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.failure);case _Loaded() when loaded != null:
return loaded(_that.courses,_that.hasReachedMaxCourses);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CourseState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseState.initial()';
}


}




/// @nodoc


class _Loading implements CourseState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseState.loading()';
}


}




/// @nodoc


class _Error implements CourseState {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of CourseState
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
  return 'CourseState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CourseStateCopyWith<$Res> {
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

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class _Loaded implements CourseState {
  const _Loaded({final  List<CourseEntity>? courses, this.hasReachedMaxCourses}): _courses = courses;
  

 final  List<CourseEntity>? _courses;
 List<CourseEntity>? get courses {
  final value = _courses;
  if (value == null) return null;
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? hasReachedMaxCourses;

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._courses, _courses)&&(identical(other.hasReachedMaxCourses, hasReachedMaxCourses) || other.hasReachedMaxCourses == hasReachedMaxCourses));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_courses),hasReachedMaxCourses);

@override
String toString() {
  return 'CourseState.loaded(courses: $courses, hasReachedMaxCourses: $hasReachedMaxCourses)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CourseStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<CourseEntity>? courses, bool? hasReachedMaxCourses
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courses = freezed,Object? hasReachedMaxCourses = freezed,}) {
  return _then(_Loaded(
courses: freezed == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<CourseEntity>?,hasReachedMaxCourses: freezed == hasReachedMaxCourses ? _self.hasReachedMaxCourses : hasReachedMaxCourses // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on

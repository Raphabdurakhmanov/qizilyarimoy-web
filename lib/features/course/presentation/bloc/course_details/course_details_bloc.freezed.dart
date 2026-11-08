// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseDetailsEvent()';
}


}

/// @nodoc
class $CourseDetailsEventCopyWith<$Res>  {
$CourseDetailsEventCopyWith(CourseDetailsEvent _, $Res Function(CourseDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [CourseDetailsEvent].
extension CourseDetailsEventPatterns on CourseDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchCourseModules value)?  fetchCourseModules,TResult Function( _FetchComments value)?  fetchComments,TResult Function( _GetCourseDetails value)?  getCourseDetails,TResult Function( _EnrollCourse value)?  enrollCourse,TResult Function( _SendComment value)?  sendComment,TResult Function( _LikeComment value)?  likeComment,TResult Function( _CompleteLesson value)?  completeLesson,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCourseModules() when fetchCourseModules != null:
return fetchCourseModules(_that);case _FetchComments() when fetchComments != null:
return fetchComments(_that);case _GetCourseDetails() when getCourseDetails != null:
return getCourseDetails(_that);case _EnrollCourse() when enrollCourse != null:
return enrollCourse(_that);case _SendComment() when sendComment != null:
return sendComment(_that);case _LikeComment() when likeComment != null:
return likeComment(_that);case _CompleteLesson() when completeLesson != null:
return completeLesson(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchCourseModules value)  fetchCourseModules,required TResult Function( _FetchComments value)  fetchComments,required TResult Function( _GetCourseDetails value)  getCourseDetails,required TResult Function( _EnrollCourse value)  enrollCourse,required TResult Function( _SendComment value)  sendComment,required TResult Function( _LikeComment value)  likeComment,required TResult Function( _CompleteLesson value)  completeLesson,}){
final _that = this;
switch (_that) {
case _FetchCourseModules():
return fetchCourseModules(_that);case _FetchComments():
return fetchComments(_that);case _GetCourseDetails():
return getCourseDetails(_that);case _EnrollCourse():
return enrollCourse(_that);case _SendComment():
return sendComment(_that);case _LikeComment():
return likeComment(_that);case _CompleteLesson():
return completeLesson(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchCourseModules value)?  fetchCourseModules,TResult? Function( _FetchComments value)?  fetchComments,TResult? Function( _GetCourseDetails value)?  getCourseDetails,TResult? Function( _EnrollCourse value)?  enrollCourse,TResult? Function( _SendComment value)?  sendComment,TResult? Function( _LikeComment value)?  likeComment,TResult? Function( _CompleteLesson value)?  completeLesson,}){
final _that = this;
switch (_that) {
case _FetchCourseModules() when fetchCourseModules != null:
return fetchCourseModules(_that);case _FetchComments() when fetchComments != null:
return fetchComments(_that);case _GetCourseDetails() when getCourseDetails != null:
return getCourseDetails(_that);case _EnrollCourse() when enrollCourse != null:
return enrollCourse(_that);case _SendComment() when sendComment != null:
return sendComment(_that);case _LikeComment() when likeComment != null:
return likeComment(_that);case _CompleteLesson() when completeLesson != null:
return completeLesson(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int courseId)?  fetchCourseModules,TResult Function( int courseId,  String? url)?  fetchComments,TResult Function( int courseId)?  getCourseDetails,TResult Function( int courseId)?  enrollCourse,TResult Function( int courseId,  String text,  int? parent)?  sendComment,TResult Function( int commentId)?  likeComment,TResult Function( LessonEntity lesson)?  completeLesson,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCourseModules() when fetchCourseModules != null:
return fetchCourseModules(_that.courseId);case _FetchComments() when fetchComments != null:
return fetchComments(_that.courseId,_that.url);case _GetCourseDetails() when getCourseDetails != null:
return getCourseDetails(_that.courseId);case _EnrollCourse() when enrollCourse != null:
return enrollCourse(_that.courseId);case _SendComment() when sendComment != null:
return sendComment(_that.courseId,_that.text,_that.parent);case _LikeComment() when likeComment != null:
return likeComment(_that.commentId);case _CompleteLesson() when completeLesson != null:
return completeLesson(_that.lesson);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int courseId)  fetchCourseModules,required TResult Function( int courseId,  String? url)  fetchComments,required TResult Function( int courseId)  getCourseDetails,required TResult Function( int courseId)  enrollCourse,required TResult Function( int courseId,  String text,  int? parent)  sendComment,required TResult Function( int commentId)  likeComment,required TResult Function( LessonEntity lesson)  completeLesson,}) {final _that = this;
switch (_that) {
case _FetchCourseModules():
return fetchCourseModules(_that.courseId);case _FetchComments():
return fetchComments(_that.courseId,_that.url);case _GetCourseDetails():
return getCourseDetails(_that.courseId);case _EnrollCourse():
return enrollCourse(_that.courseId);case _SendComment():
return sendComment(_that.courseId,_that.text,_that.parent);case _LikeComment():
return likeComment(_that.commentId);case _CompleteLesson():
return completeLesson(_that.lesson);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int courseId)?  fetchCourseModules,TResult? Function( int courseId,  String? url)?  fetchComments,TResult? Function( int courseId)?  getCourseDetails,TResult? Function( int courseId)?  enrollCourse,TResult? Function( int courseId,  String text,  int? parent)?  sendComment,TResult? Function( int commentId)?  likeComment,TResult? Function( LessonEntity lesson)?  completeLesson,}) {final _that = this;
switch (_that) {
case _FetchCourseModules() when fetchCourseModules != null:
return fetchCourseModules(_that.courseId);case _FetchComments() when fetchComments != null:
return fetchComments(_that.courseId,_that.url);case _GetCourseDetails() when getCourseDetails != null:
return getCourseDetails(_that.courseId);case _EnrollCourse() when enrollCourse != null:
return enrollCourse(_that.courseId);case _SendComment() when sendComment != null:
return sendComment(_that.courseId,_that.text,_that.parent);case _LikeComment() when likeComment != null:
return likeComment(_that.commentId);case _CompleteLesson() when completeLesson != null:
return completeLesson(_that.lesson);case _:
  return null;

}
}

}

/// @nodoc


class _FetchCourseModules implements CourseDetailsEvent {
  const _FetchCourseModules(this.courseId);
  

 final  int courseId;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCourseModulesCopyWith<_FetchCourseModules> get copyWith => __$FetchCourseModulesCopyWithImpl<_FetchCourseModules>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCourseModules&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId);

@override
String toString() {
  return 'CourseDetailsEvent.fetchCourseModules(courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$FetchCourseModulesCopyWith<$Res> implements $CourseDetailsEventCopyWith<$Res> {
  factory _$FetchCourseModulesCopyWith(_FetchCourseModules value, $Res Function(_FetchCourseModules) _then) = __$FetchCourseModulesCopyWithImpl;
@useResult
$Res call({
 int courseId
});




}
/// @nodoc
class __$FetchCourseModulesCopyWithImpl<$Res>
    implements _$FetchCourseModulesCopyWith<$Res> {
  __$FetchCourseModulesCopyWithImpl(this._self, this._then);

  final _FetchCourseModules _self;
  final $Res Function(_FetchCourseModules) _then;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseId = null,}) {
  return _then(_FetchCourseModules(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FetchComments implements CourseDetailsEvent {
  const _FetchComments(this.courseId, {this.url});
  

 final  int courseId;
 final  String? url;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCommentsCopyWith<_FetchComments> get copyWith => __$FetchCommentsCopyWithImpl<_FetchComments>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchComments&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,courseId,url);

@override
String toString() {
  return 'CourseDetailsEvent.fetchComments(courseId: $courseId, url: $url)';
}


}

/// @nodoc
abstract mixin class _$FetchCommentsCopyWith<$Res> implements $CourseDetailsEventCopyWith<$Res> {
  factory _$FetchCommentsCopyWith(_FetchComments value, $Res Function(_FetchComments) _then) = __$FetchCommentsCopyWithImpl;
@useResult
$Res call({
 int courseId, String? url
});




}
/// @nodoc
class __$FetchCommentsCopyWithImpl<$Res>
    implements _$FetchCommentsCopyWith<$Res> {
  __$FetchCommentsCopyWithImpl(this._self, this._then);

  final _FetchComments _self;
  final $Res Function(_FetchComments) _then;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseId = null,Object? url = freezed,}) {
  return _then(_FetchComments(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _GetCourseDetails implements CourseDetailsEvent {
  const _GetCourseDetails(this.courseId);
  

 final  int courseId;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCourseDetailsCopyWith<_GetCourseDetails> get copyWith => __$GetCourseDetailsCopyWithImpl<_GetCourseDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCourseDetails&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId);

@override
String toString() {
  return 'CourseDetailsEvent.getCourseDetails(courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$GetCourseDetailsCopyWith<$Res> implements $CourseDetailsEventCopyWith<$Res> {
  factory _$GetCourseDetailsCopyWith(_GetCourseDetails value, $Res Function(_GetCourseDetails) _then) = __$GetCourseDetailsCopyWithImpl;
@useResult
$Res call({
 int courseId
});




}
/// @nodoc
class __$GetCourseDetailsCopyWithImpl<$Res>
    implements _$GetCourseDetailsCopyWith<$Res> {
  __$GetCourseDetailsCopyWithImpl(this._self, this._then);

  final _GetCourseDetails _self;
  final $Res Function(_GetCourseDetails) _then;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseId = null,}) {
  return _then(_GetCourseDetails(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _EnrollCourse implements CourseDetailsEvent {
  const _EnrollCourse(this.courseId);
  

 final  int courseId;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnrollCourseCopyWith<_EnrollCourse> get copyWith => __$EnrollCourseCopyWithImpl<_EnrollCourse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnrollCourse&&(identical(other.courseId, courseId) || other.courseId == courseId));
}


@override
int get hashCode => Object.hash(runtimeType,courseId);

@override
String toString() {
  return 'CourseDetailsEvent.enrollCourse(courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$EnrollCourseCopyWith<$Res> implements $CourseDetailsEventCopyWith<$Res> {
  factory _$EnrollCourseCopyWith(_EnrollCourse value, $Res Function(_EnrollCourse) _then) = __$EnrollCourseCopyWithImpl;
@useResult
$Res call({
 int courseId
});




}
/// @nodoc
class __$EnrollCourseCopyWithImpl<$Res>
    implements _$EnrollCourseCopyWith<$Res> {
  __$EnrollCourseCopyWithImpl(this._self, this._then);

  final _EnrollCourse _self;
  final $Res Function(_EnrollCourse) _then;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseId = null,}) {
  return _then(_EnrollCourse(
null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SendComment implements CourseDetailsEvent {
  const _SendComment({required this.courseId, required this.text, this.parent});
  

 final  int courseId;
 final  String text;
 final  int? parent;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendCommentCopyWith<_SendComment> get copyWith => __$SendCommentCopyWithImpl<_SendComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendComment&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.text, text) || other.text == text)&&(identical(other.parent, parent) || other.parent == parent));
}


@override
int get hashCode => Object.hash(runtimeType,courseId,text,parent);

@override
String toString() {
  return 'CourseDetailsEvent.sendComment(courseId: $courseId, text: $text, parent: $parent)';
}


}

/// @nodoc
abstract mixin class _$SendCommentCopyWith<$Res> implements $CourseDetailsEventCopyWith<$Res> {
  factory _$SendCommentCopyWith(_SendComment value, $Res Function(_SendComment) _then) = __$SendCommentCopyWithImpl;
@useResult
$Res call({
 int courseId, String text, int? parent
});




}
/// @nodoc
class __$SendCommentCopyWithImpl<$Res>
    implements _$SendCommentCopyWith<$Res> {
  __$SendCommentCopyWithImpl(this._self, this._then);

  final _SendComment _self;
  final $Res Function(_SendComment) _then;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseId = null,Object? text = null,Object? parent = freezed,}) {
  return _then(_SendComment(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _LikeComment implements CourseDetailsEvent {
  const _LikeComment(this.commentId);
  

 final  int commentId;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeCommentCopyWith<_LikeComment> get copyWith => __$LikeCommentCopyWithImpl<_LikeComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeComment&&(identical(other.commentId, commentId) || other.commentId == commentId));
}


@override
int get hashCode => Object.hash(runtimeType,commentId);

@override
String toString() {
  return 'CourseDetailsEvent.likeComment(commentId: $commentId)';
}


}

/// @nodoc
abstract mixin class _$LikeCommentCopyWith<$Res> implements $CourseDetailsEventCopyWith<$Res> {
  factory _$LikeCommentCopyWith(_LikeComment value, $Res Function(_LikeComment) _then) = __$LikeCommentCopyWithImpl;
@useResult
$Res call({
 int commentId
});




}
/// @nodoc
class __$LikeCommentCopyWithImpl<$Res>
    implements _$LikeCommentCopyWith<$Res> {
  __$LikeCommentCopyWithImpl(this._self, this._then);

  final _LikeComment _self;
  final $Res Function(_LikeComment) _then;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commentId = null,}) {
  return _then(_LikeComment(
null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CompleteLesson implements CourseDetailsEvent {
  const _CompleteLesson(this.lesson);
  

 final  LessonEntity lesson;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompleteLessonCopyWith<_CompleteLesson> get copyWith => __$CompleteLessonCopyWithImpl<_CompleteLesson>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteLesson&&(identical(other.lesson, lesson) || other.lesson == lesson));
}


@override
int get hashCode => Object.hash(runtimeType,lesson);

@override
String toString() {
  return 'CourseDetailsEvent.completeLesson(lesson: $lesson)';
}


}

/// @nodoc
abstract mixin class _$CompleteLessonCopyWith<$Res> implements $CourseDetailsEventCopyWith<$Res> {
  factory _$CompleteLessonCopyWith(_CompleteLesson value, $Res Function(_CompleteLesson) _then) = __$CompleteLessonCopyWithImpl;
@useResult
$Res call({
 LessonEntity lesson
});




}
/// @nodoc
class __$CompleteLessonCopyWithImpl<$Res>
    implements _$CompleteLessonCopyWith<$Res> {
  __$CompleteLessonCopyWithImpl(this._self, this._then);

  final _CompleteLesson _self;
  final $Res Function(_CompleteLesson) _then;

/// Create a copy of CourseDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lesson = null,}) {
  return _then(_CompleteLesson(
null == lesson ? _self.lesson : lesson // ignore: cast_nullable_to_non_nullable
as LessonEntity,
  ));
}


}

/// @nodoc
mixin _$CourseDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseDetailsState()';
}


}

/// @nodoc
class $CourseDetailsStateCopyWith<$Res>  {
$CourseDetailsStateCopyWith(CourseDetailsState _, $Res Function(CourseDetailsState) __);
}


/// Adds pattern-matching-related methods to [CourseDetailsState].
extension CourseDetailsStatePatterns on CourseDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Loaded value)?  loaded,TResult Function( _LoadedComments value)?  loadedComments,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Loaded() when loaded != null:
return loaded(_that);case _LoadedComments() when loadedComments != null:
return loadedComments(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Loaded value)  loaded,required TResult Function( _LoadedComments value)  loadedComments,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _Loaded():
return loaded(_that);case _LoadedComments():
return loadedComments(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Loaded value)?  loaded,TResult? Function( _LoadedComments value)?  loadedComments,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Loaded() when loaded != null:
return loaded(_that);case _LoadedComments() when loadedComments != null:
return loadedComments(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Failure failure)?  error,TResult Function( List<ModuleEntity>? modules,  bool? hasReachedMaxModules,  CourseEntity? courseDetails,  LessonEntity? activeLesson,  bool isPostingComment)?  loaded,TResult Function( List<CommentEntity>? comments,  bool isPostingComment)?  loadedComments,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.failure);case _Loaded() when loaded != null:
return loaded(_that.modules,_that.hasReachedMaxModules,_that.courseDetails,_that.activeLesson,_that.isPostingComment);case _LoadedComments() when loadedComments != null:
return loadedComments(_that.comments,_that.isPostingComment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Failure failure)  error,required TResult Function( List<ModuleEntity>? modules,  bool? hasReachedMaxModules,  CourseEntity? courseDetails,  LessonEntity? activeLesson,  bool isPostingComment)  loaded,required TResult Function( List<CommentEntity>? comments,  bool isPostingComment)  loadedComments,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Error():
return error(_that.failure);case _Loaded():
return loaded(_that.modules,_that.hasReachedMaxModules,_that.courseDetails,_that.activeLesson,_that.isPostingComment);case _LoadedComments():
return loadedComments(_that.comments,_that.isPostingComment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Failure failure)?  error,TResult? Function( List<ModuleEntity>? modules,  bool? hasReachedMaxModules,  CourseEntity? courseDetails,  LessonEntity? activeLesson,  bool isPostingComment)?  loaded,TResult? Function( List<CommentEntity>? comments,  bool isPostingComment)?  loadedComments,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.failure);case _Loaded() when loaded != null:
return loaded(_that.modules,_that.hasReachedMaxModules,_that.courseDetails,_that.activeLesson,_that.isPostingComment);case _LoadedComments() when loadedComments != null:
return loadedComments(_that.comments,_that.isPostingComment);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CourseDetailsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseDetailsState.initial()';
}


}




/// @nodoc


class _Loading implements CourseDetailsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseDetailsState.loading()';
}


}




/// @nodoc


class _Error implements CourseDetailsState {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of CourseDetailsState
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
  return 'CourseDetailsState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CourseDetailsStateCopyWith<$Res> {
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

/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class _Loaded implements CourseDetailsState {
  const _Loaded({final  List<ModuleEntity>? modules, this.hasReachedMaxModules, this.courseDetails, this.activeLesson, this.isPostingComment = false}): _modules = modules;
  

 final  List<ModuleEntity>? _modules;
 List<ModuleEntity>? get modules {
  final value = _modules;
  if (value == null) return null;
  if (_modules is EqualUnmodifiableListView) return _modules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  bool? hasReachedMaxModules;
 final  CourseEntity? courseDetails;
 final  LessonEntity? activeLesson;
@JsonKey() final  bool isPostingComment;

/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._modules, _modules)&&(identical(other.hasReachedMaxModules, hasReachedMaxModules) || other.hasReachedMaxModules == hasReachedMaxModules)&&(identical(other.courseDetails, courseDetails) || other.courseDetails == courseDetails)&&(identical(other.activeLesson, activeLesson) || other.activeLesson == activeLesson)&&(identical(other.isPostingComment, isPostingComment) || other.isPostingComment == isPostingComment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_modules),hasReachedMaxModules,courseDetails,activeLesson,isPostingComment);

@override
String toString() {
  return 'CourseDetailsState.loaded(modules: $modules, hasReachedMaxModules: $hasReachedMaxModules, courseDetails: $courseDetails, activeLesson: $activeLesson, isPostingComment: $isPostingComment)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CourseDetailsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ModuleEntity>? modules, bool? hasReachedMaxModules, CourseEntity? courseDetails, LessonEntity? activeLesson, bool isPostingComment
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? modules = freezed,Object? hasReachedMaxModules = freezed,Object? courseDetails = freezed,Object? activeLesson = freezed,Object? isPostingComment = null,}) {
  return _then(_Loaded(
modules: freezed == modules ? _self._modules : modules // ignore: cast_nullable_to_non_nullable
as List<ModuleEntity>?,hasReachedMaxModules: freezed == hasReachedMaxModules ? _self.hasReachedMaxModules : hasReachedMaxModules // ignore: cast_nullable_to_non_nullable
as bool?,courseDetails: freezed == courseDetails ? _self.courseDetails : courseDetails // ignore: cast_nullable_to_non_nullable
as CourseEntity?,activeLesson: freezed == activeLesson ? _self.activeLesson : activeLesson // ignore: cast_nullable_to_non_nullable
as LessonEntity?,isPostingComment: null == isPostingComment ? _self.isPostingComment : isPostingComment // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _LoadedComments implements CourseDetailsState {
  const _LoadedComments({final  List<CommentEntity>? comments, this.isPostingComment = false}): _comments = comments;
  

 final  List<CommentEntity>? _comments;
 List<CommentEntity>? get comments {
  final value = _comments;
  if (value == null) return null;
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@JsonKey() final  bool isPostingComment;

/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCommentsCopyWith<_LoadedComments> get copyWith => __$LoadedCommentsCopyWithImpl<_LoadedComments>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedComments&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.isPostingComment, isPostingComment) || other.isPostingComment == isPostingComment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments),isPostingComment);

@override
String toString() {
  return 'CourseDetailsState.loadedComments(comments: $comments, isPostingComment: $isPostingComment)';
}


}

/// @nodoc
abstract mixin class _$LoadedCommentsCopyWith<$Res> implements $CourseDetailsStateCopyWith<$Res> {
  factory _$LoadedCommentsCopyWith(_LoadedComments value, $Res Function(_LoadedComments) _then) = __$LoadedCommentsCopyWithImpl;
@useResult
$Res call({
 List<CommentEntity>? comments, bool isPostingComment
});




}
/// @nodoc
class __$LoadedCommentsCopyWithImpl<$Res>
    implements _$LoadedCommentsCopyWith<$Res> {
  __$LoadedCommentsCopyWithImpl(this._self, this._then);

  final _LoadedComments _self;
  final $Res Function(_LoadedComments) _then;

/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comments = freezed,Object? isPostingComment = null,}) {
  return _then(_LoadedComments(
comments: freezed == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>?,isPostingComment: null == isPostingComment ? _self.isPostingComment : isPostingComment // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent()';
}


}

/// @nodoc
class $NewsEventCopyWith<$Res>  {
$NewsEventCopyWith(NewsEvent _, $Res Function(NewsEvent) __);
}


/// Adds pattern-matching-related methods to [NewsEvent].
extension NewsEventPatterns on NewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchNews value)?  fetchNews,TResult Function( _LikePost value)?  likePost,TResult Function( _LikeComment value)?  likeComment,TResult Function( _ViewPost value)?  viewPost,TResult Function( _PostComment value)?  postComment,TResult Function( _FetchComments value)?  fetchComments,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchNews() when fetchNews != null:
return fetchNews(_that);case _LikePost() when likePost != null:
return likePost(_that);case _LikeComment() when likeComment != null:
return likeComment(_that);case _ViewPost() when viewPost != null:
return viewPost(_that);case _PostComment() when postComment != null:
return postComment(_that);case _FetchComments() when fetchComments != null:
return fetchComments(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchNews value)  fetchNews,required TResult Function( _LikePost value)  likePost,required TResult Function( _LikeComment value)  likeComment,required TResult Function( _ViewPost value)  viewPost,required TResult Function( _PostComment value)  postComment,required TResult Function( _FetchComments value)  fetchComments,}){
final _that = this;
switch (_that) {
case _FetchNews():
return fetchNews(_that);case _LikePost():
return likePost(_that);case _LikeComment():
return likeComment(_that);case _ViewPost():
return viewPost(_that);case _PostComment():
return postComment(_that);case _FetchComments():
return fetchComments(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchNews value)?  fetchNews,TResult? Function( _LikePost value)?  likePost,TResult? Function( _LikeComment value)?  likeComment,TResult? Function( _ViewPost value)?  viewPost,TResult? Function( _PostComment value)?  postComment,TResult? Function( _FetchComments value)?  fetchComments,}){
final _that = this;
switch (_that) {
case _FetchNews() when fetchNews != null:
return fetchNews(_that);case _LikePost() when likePost != null:
return likePost(_that);case _LikeComment() when likeComment != null:
return likeComment(_that);case _ViewPost() when viewPost != null:
return viewPost(_that);case _PostComment() when postComment != null:
return postComment(_that);case _FetchComments() when fetchComments != null:
return fetchComments(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchNews,TResult Function( int postId)?  likePost,TResult Function( int commmentId)?  likeComment,TResult Function( int postId)?  viewPost,TResult Function( int postId,  String comment,  int? parentId)?  postComment,TResult Function( int postId)?  fetchComments,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchNews() when fetchNews != null:
return fetchNews();case _LikePost() when likePost != null:
return likePost(_that.postId);case _LikeComment() when likeComment != null:
return likeComment(_that.commmentId);case _ViewPost() when viewPost != null:
return viewPost(_that.postId);case _PostComment() when postComment != null:
return postComment(_that.postId,_that.comment,_that.parentId);case _FetchComments() when fetchComments != null:
return fetchComments(_that.postId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchNews,required TResult Function( int postId)  likePost,required TResult Function( int commmentId)  likeComment,required TResult Function( int postId)  viewPost,required TResult Function( int postId,  String comment,  int? parentId)  postComment,required TResult Function( int postId)  fetchComments,}) {final _that = this;
switch (_that) {
case _FetchNews():
return fetchNews();case _LikePost():
return likePost(_that.postId);case _LikeComment():
return likeComment(_that.commmentId);case _ViewPost():
return viewPost(_that.postId);case _PostComment():
return postComment(_that.postId,_that.comment,_that.parentId);case _FetchComments():
return fetchComments(_that.postId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchNews,TResult? Function( int postId)?  likePost,TResult? Function( int commmentId)?  likeComment,TResult? Function( int postId)?  viewPost,TResult? Function( int postId,  String comment,  int? parentId)?  postComment,TResult? Function( int postId)?  fetchComments,}) {final _that = this;
switch (_that) {
case _FetchNews() when fetchNews != null:
return fetchNews();case _LikePost() when likePost != null:
return likePost(_that.postId);case _LikeComment() when likeComment != null:
return likeComment(_that.commmentId);case _ViewPost() when viewPost != null:
return viewPost(_that.postId);case _PostComment() when postComment != null:
return postComment(_that.postId,_that.comment,_that.parentId);case _FetchComments() when fetchComments != null:
return fetchComments(_that.postId);case _:
  return null;

}
}

}

/// @nodoc


class _FetchNews implements NewsEvent {
  const _FetchNews();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNews);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent.fetchNews()';
}


}




/// @nodoc


class _LikePost implements NewsEvent {
  const _LikePost(this.postId);
  

 final  int postId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikePostCopyWith<_LikePost> get copyWith => __$LikePostCopyWithImpl<_LikePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikePost&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'NewsEvent.likePost(postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$LikePostCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory _$LikePostCopyWith(_LikePost value, $Res Function(_LikePost) _then) = __$LikePostCopyWithImpl;
@useResult
$Res call({
 int postId
});




}
/// @nodoc
class __$LikePostCopyWithImpl<$Res>
    implements _$LikePostCopyWith<$Res> {
  __$LikePostCopyWithImpl(this._self, this._then);

  final _LikePost _self;
  final $Res Function(_LikePost) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(_LikePost(
null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _LikeComment implements NewsEvent {
  const _LikeComment(this.commmentId);
  

 final  int commmentId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeCommentCopyWith<_LikeComment> get copyWith => __$LikeCommentCopyWithImpl<_LikeComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeComment&&(identical(other.commmentId, commmentId) || other.commmentId == commmentId));
}


@override
int get hashCode => Object.hash(runtimeType,commmentId);

@override
String toString() {
  return 'NewsEvent.likeComment(commmentId: $commmentId)';
}


}

/// @nodoc
abstract mixin class _$LikeCommentCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory _$LikeCommentCopyWith(_LikeComment value, $Res Function(_LikeComment) _then) = __$LikeCommentCopyWithImpl;
@useResult
$Res call({
 int commmentId
});




}
/// @nodoc
class __$LikeCommentCopyWithImpl<$Res>
    implements _$LikeCommentCopyWith<$Res> {
  __$LikeCommentCopyWithImpl(this._self, this._then);

  final _LikeComment _self;
  final $Res Function(_LikeComment) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commmentId = null,}) {
  return _then(_LikeComment(
null == commmentId ? _self.commmentId : commmentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ViewPost implements NewsEvent {
  const _ViewPost(this.postId);
  

 final  int postId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewPostCopyWith<_ViewPost> get copyWith => __$ViewPostCopyWithImpl<_ViewPost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewPost&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'NewsEvent.viewPost(postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$ViewPostCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory _$ViewPostCopyWith(_ViewPost value, $Res Function(_ViewPost) _then) = __$ViewPostCopyWithImpl;
@useResult
$Res call({
 int postId
});




}
/// @nodoc
class __$ViewPostCopyWithImpl<$Res>
    implements _$ViewPostCopyWith<$Res> {
  __$ViewPostCopyWithImpl(this._self, this._then);

  final _ViewPost _self;
  final $Res Function(_ViewPost) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(_ViewPost(
null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _PostComment implements NewsEvent {
  const _PostComment(this.postId, this.comment, {this.parentId});
  

 final  int postId;
 final  String comment;
 final  int? parentId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCommentCopyWith<_PostComment> get copyWith => __$PostCommentCopyWithImpl<_PostComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostComment&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,postId,comment,parentId);

@override
String toString() {
  return 'NewsEvent.postComment(postId: $postId, comment: $comment, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class _$PostCommentCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory _$PostCommentCopyWith(_PostComment value, $Res Function(_PostComment) _then) = __$PostCommentCopyWithImpl;
@useResult
$Res call({
 int postId, String comment, int? parentId
});




}
/// @nodoc
class __$PostCommentCopyWithImpl<$Res>
    implements _$PostCommentCopyWith<$Res> {
  __$PostCommentCopyWithImpl(this._self, this._then);

  final _PostComment _self;
  final $Res Function(_PostComment) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? comment = null,Object? parentId = freezed,}) {
  return _then(_PostComment(
null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _FetchComments implements NewsEvent {
  const _FetchComments(this.postId);
  

 final  int postId;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCommentsCopyWith<_FetchComments> get copyWith => __$FetchCommentsCopyWithImpl<_FetchComments>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchComments&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'NewsEvent.fetchComments(postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$FetchCommentsCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory _$FetchCommentsCopyWith(_FetchComments value, $Res Function(_FetchComments) _then) = __$FetchCommentsCopyWithImpl;
@useResult
$Res call({
 int postId
});




}
/// @nodoc
class __$FetchCommentsCopyWithImpl<$Res>
    implements _$FetchCommentsCopyWith<$Res> {
  __$FetchCommentsCopyWithImpl(this._self, this._then);

  final _FetchComments _self;
  final $Res Function(_FetchComments) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(_FetchComments(
null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$NewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState()';
}


}

/// @nodoc
class $NewsStateCopyWith<$Res>  {
$NewsStateCopyWith(NewsState _, $Res Function(NewsState) __);
}


/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,TResult Function( _CommentsSuccess value)?  commentsSuccess,TResult Function( _LikeSuccess value)?  likeSuccess,TResult Function( _PostCommentSuccess value)?  postCommentSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _CommentsSuccess() when commentsSuccess != null:
return commentsSuccess(_that);case _LikeSuccess() when likeSuccess != null:
return likeSuccess(_that);case _PostCommentSuccess() when postCommentSuccess != null:
return postCommentSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,required TResult Function( _CommentsSuccess value)  commentsSuccess,required TResult Function( _LikeSuccess value)  likeSuccess,required TResult Function( _PostCommentSuccess value)  postCommentSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _CommentsSuccess():
return commentsSuccess(_that);case _LikeSuccess():
return likeSuccess(_that);case _PostCommentSuccess():
return postCommentSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,TResult? Function( _CommentsSuccess value)?  commentsSuccess,TResult? Function( _LikeSuccess value)?  likeSuccess,TResult? Function( _PostCommentSuccess value)?  postCommentSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _CommentsSuccess() when commentsSuccess != null:
return commentsSuccess(_that);case _LikeSuccess() when likeSuccess != null:
return likeSuccess(_that);case _PostCommentSuccess() when postCommentSuccess != null:
return postCommentSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<NewsEntity> news,  bool hasReachedMax)?  loaded,TResult Function( Failure failure)?  error,TResult Function( List<CommentEntity> comments)?  commentsSuccess,TResult Function()?  likeSuccess,TResult Function( CommentEntity comment)?  postCommentSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.news,_that.hasReachedMax);case _Error() when error != null:
return error(_that.failure);case _CommentsSuccess() when commentsSuccess != null:
return commentsSuccess(_that.comments);case _LikeSuccess() when likeSuccess != null:
return likeSuccess();case _PostCommentSuccess() when postCommentSuccess != null:
return postCommentSuccess(_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<NewsEntity> news,  bool hasReachedMax)  loaded,required TResult Function( Failure failure)  error,required TResult Function( List<CommentEntity> comments)  commentsSuccess,required TResult Function()  likeSuccess,required TResult Function( CommentEntity comment)  postCommentSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.news,_that.hasReachedMax);case _Error():
return error(_that.failure);case _CommentsSuccess():
return commentsSuccess(_that.comments);case _LikeSuccess():
return likeSuccess();case _PostCommentSuccess():
return postCommentSuccess(_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<NewsEntity> news,  bool hasReachedMax)?  loaded,TResult? Function( Failure failure)?  error,TResult? Function( List<CommentEntity> comments)?  commentsSuccess,TResult? Function()?  likeSuccess,TResult? Function( CommentEntity comment)?  postCommentSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.news,_that.hasReachedMax);case _Error() when error != null:
return error(_that.failure);case _CommentsSuccess() when commentsSuccess != null:
return commentsSuccess(_that.comments);case _LikeSuccess() when likeSuccess != null:
return likeSuccess();case _PostCommentSuccess() when postCommentSuccess != null:
return postCommentSuccess(_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements NewsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.initial()';
}


}




/// @nodoc


class _Loading implements NewsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.loading()';
}


}




/// @nodoc


class _Loaded implements NewsState {
  const _Loaded({required final  List<NewsEntity> news, required this.hasReachedMax}): _news = news;
  

 final  List<NewsEntity> _news;
 List<NewsEntity> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}

 final  bool hasReachedMax;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._news, _news)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news),hasReachedMax);

@override
String toString() {
  return 'NewsState.loaded(news: $news, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<NewsEntity> news, bool hasReachedMax
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,Object? hasReachedMax = null,}) {
  return _then(_Loaded(
news: null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements NewsState {
  const _Error({required this.failure});
  

 final  Failure failure;

/// Create a copy of NewsState
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
  return 'NewsState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
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

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class _CommentsSuccess implements NewsState {
  const _CommentsSuccess(final  List<CommentEntity> comments): _comments = comments;
  

 final  List<CommentEntity> _comments;
 List<CommentEntity> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentsSuccessCopyWith<_CommentsSuccess> get copyWith => __$CommentsSuccessCopyWithImpl<_CommentsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentsSuccess&&const DeepCollectionEquality().equals(other._comments, _comments));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'NewsState.commentsSuccess(comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$CommentsSuccessCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$CommentsSuccessCopyWith(_CommentsSuccess value, $Res Function(_CommentsSuccess) _then) = __$CommentsSuccessCopyWithImpl;
@useResult
$Res call({
 List<CommentEntity> comments
});




}
/// @nodoc
class __$CommentsSuccessCopyWithImpl<$Res>
    implements _$CommentsSuccessCopyWith<$Res> {
  __$CommentsSuccessCopyWithImpl(this._self, this._then);

  final _CommentsSuccess _self;
  final $Res Function(_CommentsSuccess) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comments = null,}) {
  return _then(_CommentsSuccess(
null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentEntity>,
  ));
}


}

/// @nodoc


class _LikeSuccess implements NewsState {
  const _LikeSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.likeSuccess()';
}


}




/// @nodoc


class _PostCommentSuccess implements NewsState {
  const _PostCommentSuccess(this.comment);
  

 final  CommentEntity comment;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCommentSuccessCopyWith<_PostCommentSuccess> get copyWith => __$PostCommentSuccessCopyWithImpl<_PostCommentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostCommentSuccess&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString() {
  return 'NewsState.postCommentSuccess(comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$PostCommentSuccessCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$PostCommentSuccessCopyWith(_PostCommentSuccess value, $Res Function(_PostCommentSuccess) _then) = __$PostCommentSuccessCopyWithImpl;
@useResult
$Res call({
 CommentEntity comment
});




}
/// @nodoc
class __$PostCommentSuccessCopyWithImpl<$Res>
    implements _$PostCommentSuccessCopyWith<$Res> {
  __$PostCommentSuccessCopyWithImpl(this._self, this._then);

  final _PostCommentSuccess _self;
  final $Res Function(_PostCommentSuccess) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(_PostCommentSuccess(
null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as CommentEntity,
  ));
}


}

// dart format on

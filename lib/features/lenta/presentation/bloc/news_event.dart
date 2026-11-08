part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.fetchNews() = _FetchNews;
  const factory NewsEvent.likePost(int postId) = _LikePost;
  const factory NewsEvent.likeComment(int commmentId) = _LikeComment;
  const factory NewsEvent.viewPost(int postId) = _ViewPost;
  const factory NewsEvent.postComment(
    int postId,
    String comment, {
    int? parentId,
  }) = _PostComment;
  const factory NewsEvent.fetchComments(int postId) = _FetchComments;
}

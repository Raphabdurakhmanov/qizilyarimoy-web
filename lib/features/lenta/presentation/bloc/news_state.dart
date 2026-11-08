// filepath: lib/features/lenta/presentation/bloc/news_state.dart
part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.loaded({
    required List<NewsEntity> news,
    required bool hasReachedMax,
  }) = _Loaded;
  const factory NewsState.error({required Failure failure}) = _Error;
  const factory NewsState.commentsSuccess(List<CommentEntity> comments) =
      _CommentsSuccess;
  const factory NewsState.likeSuccess() = _LikeSuccess;
  const factory NewsState.postCommentSuccess(CommentEntity comment) =
      _PostCommentSuccess;
}

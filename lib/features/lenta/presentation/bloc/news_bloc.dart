import 'package:app/core/error/failure.dart';
import 'package:app/features/lenta/domain/entities/comment_entity.dart';
import 'package:app/features/lenta/domain/entities/news_entity.dart';
import 'package:app/features/lenta/domain/usecases/comments_usecase.dart';
import 'package:app/features/lenta/domain/usecases/like_comment_usecase.dart';
import 'package:app/features/lenta/domain/usecases/like_post_usecase.dart';
import 'package:app/features/lenta/domain/usecases/news_usecase.dart';
import 'package:app/features/lenta/domain/usecases/post_comment_usecase.dart';
import 'package:app/features/lenta/domain/usecases/views_post_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUsecase getNewsUseCase;
  final CommentsUseCase commentsUseCase;
  final LikePostUsecase likePostUseCase;
  final ViewsPostUsecase viewPostUseCase;
  final PostCommentUseCase postCommentUseCase;
  final LikeCommentUsecase likeCommentUsecase;

  List<NewsEntity> news = [];
  bool hasReachedMax = false;
  String? nextPageUrl;

  NewsBloc({
    required this.getNewsUseCase,
    required this.commentsUseCase,
    required this.likePostUseCase,
    required this.viewPostUseCase,
    required this.postCommentUseCase,
    required this.likeCommentUsecase,
  }) : super(NewsState.initial()) {
    on<NewsEvent>((event, emit) async {
      await event.map(
        fetchNews: (event) async => await _onFetchNews(event, emit),
        likePost: (event) async => onLikePost(event, emit),
        viewPost: (event) async => onViewPost(event, emit),
        postComment: (event) async => onPostComment(event, emit),
        fetchComments: (event) async => onFetchComments(event, emit),
        likeComment: (_LikeComment value) {
          onLikeComment(value, emit);
        },
      );
    }, transformer: throttleDroppable(throttleDuration));
  }

  void onLikePost(event, emit) async {
    final result = await likePostUseCase(postId: event.postId);
    result.fold((failure) => emit(NewsState.error(failure: failure)), (
      success,
    ) {
      news.where((post) => post.id == event.postId).forEach((post) {
        post.isLiked.value = !post.isLiked.value;
        if (post.isLiked.value) {
          post.likesCount++;
        } else {
          post.likesCount--;
        }
      });
      emit(NewsState.loaded(news: news, hasReachedMax: hasReachedMax));
      // emit(NewsState.likeSuccess());
    });
  }

  void onLikeComment(_LikeComment event, emit) async {
    print("onLikedComment");
    await likeCommentUsecase(commentId: event.commmentId);
    // result.fold((failure) => emit(NewsState.error(failure: failure)), (
    //   success,
    // ) {
    // emit(NewsState.loaded(news: news, hasReachedMax: hasReachedMax));
    // emit(NewsState.likeSuccess());
    // });
  }

  void onViewPost(event, emit) async {
    // Just send the event to the use case
    await viewPostUseCase(postId: event.postId);
    // result.fold(
    //   (failure) => emit(NewsState.error(failure: failure)),
    //   (success) {},
    // );
  }

  void onPostComment(_PostComment event, emit) async {
    final result = await postCommentUseCase(
      parentId: event.parentId,
      comment: event.comment,
      id: event.postId,
    );
    result.fold((failure) => emit(NewsState.error(failure: failure)), (
      comment,
    ) {
      emit(NewsState.postCommentSuccess(comment));
    });
  }

  void onFetchComments(event, emit) async {
    emit(NewsState.loading());
    final result = await commentsUseCase(postId: event.postId);
    result.fold((failure) => emit(NewsState.error(failure: failure)), (
      comments,
    ) {
      emit(NewsState.commentsSuccess(comments));
    });
  }

  Future<void> _onFetchNews(_FetchNews event, Emitter<NewsState> emit) async {
    final currentState = state;
    if (currentState is _Loaded && currentState.hasReachedMax) {
      return;
    }

    // On initial load, show a full-screen loader
    if (currentState is _Initial) {
      emit(const NewsState.loading());
    }
    final result = await getNewsUseCase(page: nextPageUrl);

    result.fold((failure) => emit(NewsState.error(failure: failure)), (
      paginatedNews,
    ) {
      nextPageUrl = paginatedNews.next;
      final newNews = paginatedNews.results;
      hasReachedMax = nextPageUrl == null;
      if (currentState is _Loaded) {
        news = List.of(currentState.news)..addAll(newNews);
      } else {
        news = newNews;
      }
      emit(NewsState.loaded(news: news, hasReachedMax: hasReachedMax));
    });
  }
}

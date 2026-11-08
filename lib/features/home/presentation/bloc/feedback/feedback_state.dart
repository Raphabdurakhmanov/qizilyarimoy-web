part of 'feedback_bloc.dart';

@freezed
sealed class FeedbackState with _$FeedbackState {
  const factory FeedbackState.initial() = _Initial;
  const factory FeedbackState.loading() = _Loading;
  const factory FeedbackState.loaded() = _Loaded;
  const factory FeedbackState.error(String message) = _Error;
}

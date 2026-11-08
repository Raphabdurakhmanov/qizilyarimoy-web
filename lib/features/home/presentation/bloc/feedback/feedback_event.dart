part of 'feedback_bloc.dart';

@freezed
sealed class FeedbackEvent with _$FeedbackEvent {
  const factory FeedbackEvent.sendFeedback({
    String? fullName,
    String? phone,
    String? region,
    String? content,
  }) = _SendFeedbackEvent;
}

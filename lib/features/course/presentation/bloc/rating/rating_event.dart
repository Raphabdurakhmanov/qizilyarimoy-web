part of 'rating_bloc.dart';

@freezed
sealed class RatingEvent with _$RatingEvent {
  const factory RatingEvent.submit({
    required int courseId,
    required int rating,
  }) = _Submit;
}

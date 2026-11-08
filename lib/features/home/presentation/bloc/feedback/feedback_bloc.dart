import 'package:app/features/home/data/models/feedback_model.dart';
import 'package:app/features/home/domain/usecases/feedback_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';
part 'feedback_bloc.freezed.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackUseCase feedbackUseCase;
  FeedbackBloc({required this.feedbackUseCase})
    : super(const FeedbackState.initial()) {
    on<FeedbackEvent>((event, emit) async {
      await event.map(
        sendFeedback: (event) async => await _onSendFeedback(event, emit),
      );
    }, transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onSendFeedback(
    _SendFeedbackEvent event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(const FeedbackState.loading());

    final result = await feedbackUseCase(
      FeedbackModel(
        fullName: event.fullName,
        phone: event.phone,
        region: event.region,
        content: event.content,
      ),
    );
    result.fold(
      (failure) => emit(FeedbackState.error(failure.message.toString())),
      (_) {
        emit(FeedbackState.loaded());
      },
    );
  }
}

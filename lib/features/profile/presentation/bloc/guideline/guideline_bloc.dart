import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/entities/guideline_entity.dart';
import 'package:app/features/profile/domain/usecase/get_guidelines.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'guideline_event.dart';
part 'guideline_state.dart';
part 'guideline_bloc.freezed.dart';

const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GuidelineBloc extends Bloc<GuidelineEvent, GuidelineState> {
  final GetGuidelinesUseCase getGuidelines;
  String? _nextPageUrl;
  EventTransformer<E> throttleDroppable<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }

  GuidelineBloc({required this.getGuidelines})
    : super(const GuidelineState.initial()) {
    on<GuidelineEvent>((event, emit) async {
      await event.map(
        fetchGuidelines: (event) async => await _onFetchGuidelines(event, emit),
      );
    }, transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onFetchGuidelines(
    _FetchGuidelines event,
    Emitter<GuidelineState> emit,
  ) async {
    final currentState = state;
    if (currentState is _Loaded && currentState.hasReachedMax) {
      return;
    }
    if(currentState is _Initial){
      emit(const GuidelineState.loading());
    }
    final result = await getGuidelines();
    result.fold((failure) => emit(GuidelineState.error(failure: failure)), (
      paginatedData,
    ) {
      _nextPageUrl = paginatedData.next;
      final newLeaders = paginatedData.results;
      final hasReachedMax = _nextPageUrl == null;

      List<GuidelineEntity> allGuidelines = [];
      if (currentState is _Loaded) {
        allGuidelines = List.of(currentState.guidelines)..addAll(newLeaders);
      } else {
        allGuidelines = newLeaders;
      }
      emit(
        GuidelineState.loaded(
          guidelines: allGuidelines,
          hasReachedMax: hasReachedMax,
        ),
      );
    });
  }
}

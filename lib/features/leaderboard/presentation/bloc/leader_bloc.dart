import 'package:app/config/enums/leader_type.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/leaderboard/domain/entities/leaderboard_entity.dart';
import 'package:app/features/leaderboard/domain/usecase/leader_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'leader_event.dart';
part 'leader_state.dart';
part 'leader_bloc.freezed.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class LeaderBloc extends Bloc<LeaderEvent, LeaderState> {
  final LeaderUsecase _leaderUsecase;
  String? _nextPageUrl;

  LeaderBloc({required LeaderUsecase leaderUsecase})
    : _leaderUsecase = leaderUsecase,
      super(const LeaderState.initial()) {
    on<LeaderEvent>((event, emit) async {
      await event.map(
        fetchLeaderboard:
            (event) async => await _onFetchLeaderboard(event, emit),
      );
    }, transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onFetchLeaderboard(
    _FetchLeaderboard event,
    Emitter<LeaderState> emit,
  ) async {
    final currentState = state;
    if (currentState is _Loaded && currentState.hasReachedMax) {
      return;
    }

    if (currentState is _Initial) {
      emit(const LeaderState.loading());
    }

    final result = await _leaderUsecase(url: _nextPageUrl, type: event.type);

    result.fold(
      (failure) => emit(LeaderState.error(failure: failure)),
      (paginatedData) {
        _nextPageUrl = paginatedData.next;
        final newLeaders = paginatedData.results ?? [];
        final hasReachedMax = _nextPageUrl == null;

        List<LeaderboardEntity> allLeaders = [];
        if (currentState is _Loaded) {
          allLeaders = List.of(currentState.leaders)..addAll(newLeaders);
        } else {
          allLeaders = newLeaders;
        }

        emit(
          LeaderState.loaded(leaders: allLeaders, hasReachedMax: hasReachedMax),
        );
      },
    );
  }
}

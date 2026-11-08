part of 'leader_bloc.dart';

@freezed
class LeaderState with _$LeaderState {
  const factory LeaderState.initial() = _Initial;
  const factory LeaderState.loading() = _Loading;
  const factory LeaderState.loaded({
    required List<LeaderboardEntity> leaders,
    required bool hasReachedMax,
  }) = _Loaded;
  const factory LeaderState.error({required Failure failure}) = _Error;
}

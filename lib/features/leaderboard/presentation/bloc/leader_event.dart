part of 'leader_bloc.dart';

@freezed
abstract class LeaderEvent with _$LeaderEvent {
  const factory LeaderEvent.fetchLeaderboard(LeaderboardType type) =
      _FetchLeaderboard;

}

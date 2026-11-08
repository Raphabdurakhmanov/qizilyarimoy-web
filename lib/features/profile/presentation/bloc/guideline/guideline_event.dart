part of 'guideline_bloc.dart';

@freezed
class GuidelineEvent with _$GuidelineEvent {
  const factory GuidelineEvent.fetchGuidelines() = _FetchGuidelines;
}
part of 'guideline_bloc.dart';

@freezed
class GuidelineState with _$GuidelineState {
  const factory GuidelineState.initial() = _Initial;
  const factory GuidelineState.loading() = _Loading;
  const factory GuidelineState.loaded({
    required List<GuidelineEntity> guidelines,
    required bool hasReachedMax,
  }) = _Loaded;
  const factory GuidelineState.error({required Failure failure}) = _Error;
}
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/features/course/domain/repositories/course_repository.dart';

part 'rating_event.dart';
part 'rating_state.dart';
part 'rating_bloc.freezed.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final CourseRepository repository;
  RatingBloc(this.repository) : super(const RatingState.initial()) {
    on<_Submit>(_onSubmit);
  }

  Future<void> _onSubmit(_Submit event, Emitter<RatingState> emit) async {
    emit(const RatingState.loading());
    final res = await repository.rateCourse(event.courseId, event.rating);
    res.fold(
      (l) => emit(RatingState.error(l.message)),
      (r) => emit(const RatingState.success()),
    );
  }
}

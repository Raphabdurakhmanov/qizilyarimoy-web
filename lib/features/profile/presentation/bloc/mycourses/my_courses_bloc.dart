import 'package:app/features/profile/domain/entities/mycourse_entity.dart';
import 'package:app/features/profile/domain/usecase/mycourses_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_courses_event.dart';
part 'my_courses_state.dart';
part 'my_courses_bloc.freezed.dart';

class MyCoursesBloc extends Bloc<MyCoursesEvent, MyCoursesState> {
  final MyCoursesUsecase myCoursesUsecase;
  MyCoursesBloc(this.myCoursesUsecase) : super(MyCoursesState.initial()) {
    on<MyCoursesEvent>((event, emit) async {
      await event.map(
        getMyCourses: (e) async {
          emit(MyCoursesState.loading());
          try {
            final result = await myCoursesUsecase();
            result.fold(
              (failure) => emit(MyCoursesState.error(failure.message)),
              (courses) => emit(MyCoursesState.loaded(courses)),
            );
          } catch (e) {
            emit(MyCoursesState.error(e.toString()));
          }
        },
      );
    });
  }
}

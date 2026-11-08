import 'package:app/features/home/domain/entities/notification_entity.dart';
import 'package:app/features/home/domain/usecases/fetch_notifications_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  FetchNotificationsUseCase fetchNotificationsFromRepository;

  NotificationBloc(this.fetchNotificationsFromRepository)
    : super(const NotificationState.initial()) {
    on<NotificationEvent>((event, emit) async {
      await event.map(fetchNotifications: (e) => _fetchNotifications(emit));
    });
  }

  Future<void> _fetchNotifications(Emitter<NotificationState> emit) async {
    emit(const NotificationState.loading());
    try {
      final notifications = await fetchNotificationsFromRepository();
      notifications.fold(
        (failure) => emit(NotificationState.error(failure.message)),
        (data) => emit(NotificationState.loaded(data)),
      );
    } catch (e) {
      emit(NotificationState.error(e.toString()));
    }
  }
}

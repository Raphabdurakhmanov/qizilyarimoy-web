import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/entities/profile_entity.dart';
import 'package:app/features/profile/domain/usecase/change_avatar_usecase.dart';
import 'package:app/features/profile/domain/usecase/change_password_usecase.dart';
import 'package:app/features/profile/domain/usecase/delete_account_usecase.dart';
import 'package:app/features/profile/domain/usecase/logout_usecase.dart';
import 'package:app/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:app/features/profile/domain/usecase/user_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UserBloc extends Bloc<UserEvent, UserState> {
  ProfileUseCase profileUseCase;
  UpdateProfileUseCase updateProfileUseCase;
  ChangePasswordUseCase changePasswordUseCase;
  LogoutUseCase logoutUseCase;
  ChangeAvatarUseCase changedAvatarUseCase;
  DeleteAccountUseCase deleteAccountUseCase;

  UserBloc({
    required this.profileUseCase,
    required this.changePasswordUseCase,
    required this.logoutUseCase,
    required this.updateProfileUseCase,
    required this.changedAvatarUseCase,
    required this.deleteAccountUseCase,
  }) : super(UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.map(
        changePassword: (event) async => await _onChangePassword(event, emit),
        logout: (event) async => await _onLogout(event, emit),
        updateProfile: (event) async => await _onUpdateProfile(event, emit),
        getProfile: (event) async => await _onGetProfile(event, emit),
        changeAvatar: (event) async => await _onChangeAvatar(event, emit),
        deleteAccount: (event) async => await _onDeleteAccount(event, emit),
      );
    }, transformer: throttleDroppable(throttleDuration));
  }
  Future<void> _onChangeAvatar(
    _ChangedAvatarEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading());
    final result = await changedAvatarUseCase(avatarPath: event.avatarPath);
    result.fold(
      (failure) {
        emit(UserState.error(failure: failure));
      },
      (avatar) {
        emit(UserState.changedAvatar(avatarLink: avatar));
      },
    );
  }

  Future<void> _onChangePassword(
    _ChangePasswordEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading());
    final result = await changePasswordUseCase(
      oldPassword: event.oldPassword,
      newPassword: event.newPassword,
    );
    result.fold(
      (failure) {
        emit(UserState.error(failure: failure));
      },
      (profile) {
        emit(UserState.changedPassword());
      },
    );
  }

  Future<void> _onLogout(_LogoutEvent event, Emitter<UserState> emit) async {
    emit(UserState.loading());
    final result = await logoutUseCase();
    result.fold(
      (failure) => emit(UserState.error(failure: failure)),
      (_) => emit(UserState.logout()),
    );
  }

  Future<void> _onUpdateProfile(
    _UpdateProfileEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading());
    final result = await updateProfileUseCase(
      firstName: event.firstName,
      lastName: event.lastName,
      region: event.region,
    );
    result.fold(
      (failure) {
        emit(UserState.error(failure: failure));
      },
      (profile) {
        emit(UserState.updatedProfile());
      },
    );
  }

  Future<void> _onGetProfile(
    _GetProfileEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading());
    final result = await profileUseCase();
    result.fold(
      (failure) {
        emit(UserState.error(failure: failure));
      },
      (profile) {
        emit(UserState.gotProfile(profile));
      },
    );
  }

  Future<void> _onDeleteAccount(
    _DeleteAccountEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading());
    final result = await deleteAccountUseCase();
    result.fold(
      (failure) => emit(UserState.error(failure: failure)),
      (_) => emit(UserState.deletedAccount()),
    );
  }
}

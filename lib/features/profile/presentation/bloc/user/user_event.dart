part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.changePassword({
    required String oldPassword,
    required String newPassword,
  }) = _ChangePasswordEvent;
  const factory UserEvent.logout() = _LogoutEvent;
  const factory UserEvent.updateProfile({
    String? firstName,
    String? lastName,
    String? region,
  }) = _UpdateProfileEvent;
  const factory UserEvent.getProfile() = _GetProfileEvent;
  const factory UserEvent.changeAvatar({required String avatarPath}) =
      _ChangedAvatarEvent;
  const factory UserEvent.deleteAccount() = _DeleteAccountEvent;
}

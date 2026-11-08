part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.changedPassword() = _ChangedPassword;
  const factory UserState.gotProfile(ProfileEntity profile) = _GotProfile;
  const factory UserState.logout() = _Logout;
  const factory UserState.updatedProfile() = _UpdatedProfile;
  const factory UserState.error({required Failure failure}) = _ErrorState;
  const factory UserState.changedAvatar({required String avatarLink}) =
      _ChangedAvatar;
  const factory UserState.deletedAccount() = _DeletedAccount;
}

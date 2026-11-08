part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  // Event for when the user taps the login button.
  const factory AuthEvent.login({
    required String username,
    required String password,
  }) = _LoginEvent;

  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatusEvent;
  const factory AuthEvent.logout() = _LogoutEvent;
  const factory AuthEvent.refreshToken() = _RefreshTokenEvent;
}

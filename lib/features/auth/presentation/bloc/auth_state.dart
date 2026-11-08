part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  // Represents the state before anything has happened
  const factory AuthState.initial() = _Initial;

  // Represents the state during an async operation (e.g., API call)
  const factory AuthState.loading() = _Loading;

  // Represents a successful login, holding the user data
  const factory AuthState.authenticated({
    required UserEntity user,
    bool? tokenRefreshed,
  }) = _Authenticated;

  // Represents a failed login or logged-out state, holding an error message
  const factory AuthState.unauthenticated({required String message}) =
      _Unauthenticated;
}

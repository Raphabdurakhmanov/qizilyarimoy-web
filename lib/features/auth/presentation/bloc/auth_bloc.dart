import 'package:app/features/auth/domain/entities/user_entity.dart';
import 'package:app/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:app/features/auth/domain/usecases/login_usecase.dart';
import 'package:app/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase usecase;
  final CheckAuthStatusUsecase checkAuthStatusUsecase;
  final RefreshTokenUseCase refreshTokenUseCase;
  AuthBloc({
    required this.usecase,
    required this.checkAuthStatusUsecase,
    required this.refreshTokenUseCase,
  }) : super(const AuthState.initial()) {
    on<_LoginEvent>(loginEvent);
    on<_CheckAuthStatusEvent>(_checkAuthEvent);
    on<_RefreshTokenEvent>(_refreshTokenEvent);
  }
  _refreshTokenEvent(_RefreshTokenEvent event, emit) async {
    emit(AuthState.loading());

    final result = await refreshTokenUseCase();

    result.fold(
      (failure) {
        emit(AuthState.unauthenticated(message: failure.message));
      },
      (user) {
        emit(AuthState.authenticated(user: user, tokenRefreshed: true));
      },
    );
  }

  _checkAuthEvent(_CheckAuthStatusEvent event, emit) async {
    emit(AuthState.loading());

    final user = await checkAuthStatusUsecase();
    user.fold(
      (failure) {
        emit(AuthState.unauthenticated(message: failure.message));
      },
      (user) {
        emit(AuthState.authenticated(user: user));
      },
    );
  }

  loginEvent(_LoginEvent event, emit) async {
    emit(AuthState.loading());
    final result = await usecase(
      LoginParams(username: event.username, password: event.password),
    );

    result.fold(
      (failure) {
        emit(AuthState.unauthenticated(message: failure.message));
      },
      (user) {
        emit(AuthState.authenticated(user: user));
      },
    );
  }
}

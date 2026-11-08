import 'package:app/config/app_router.dart';
import 'package:app/config/constants.dart';
import 'package:app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthEvent.checkAuthStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (user, tokenRefreshed) {
            print(tokenExpirationDate);
            print(DateTime.now());
            print((tokenExpirationDate!.isAfter(DateTime.now())));
            bool isTokenExpired =
                tokenExpirationDate == null ||
                tokenExpirationDate!.isBefore(DateTime.now());
            bool isTokenRefreshed = (tokenRefreshed != null && tokenRefreshed);
            if (isTokenExpired && !isTokenRefreshed) {
              context.read<AuthBloc>().add(AuthEvent.refreshToken());
            } else {
              context.go(AppRoutes.home);
            }
          },
          unauthenticated: (message) {
            // Navigate to login screen if unauthenticated

            context.go(AppRoutes.login);
          },
          orElse: () {},
        );
      },
      child: Scaffold(body: Center(child: const CircularProgressIndicator())),
    );
  }
}

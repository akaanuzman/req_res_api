import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../feature/views/index.dart';
import 'app_routes.dart';

@immutable
final class AppRouter {
  const AppRouter._();

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash.value,
        builder: (context, state) => const SplashView(),
        routes: [
          GoRoute(
            path: AppRoutes.login.value,
            builder: (context, state) => const LoginView(),
          ),
          GoRoute(
            path: AppRoutes.register.value,
            builder: (context, state) => const RegisterView(),
          ),
        ],
      ),
    ],
  );
}

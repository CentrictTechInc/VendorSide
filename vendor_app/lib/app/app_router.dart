import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/presentation/screens/auth/login/login_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final globalContext = _rootNavigatorKey.currentContext;
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: PagePath.login,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return child;
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/',
              builder: (context, state) {
                return const Scaffold(
                  body: CommonText(
                    text: "Welcome ",
                  ),
                );
              },
              routes: const [],
            ),
          ],
        ),
        GoRoute(
            path: PagePath.login,
            builder: (context, state) {
              return const LoginScreen();
            }),
      ]);
}

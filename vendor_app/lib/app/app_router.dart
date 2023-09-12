import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/data/dto/registration_dto.dart';
import 'package:vendor_app/presentation/screens/auth/category/category_screen.dart';
import 'package:vendor_app/presentation/screens/auth/login/login_screen.dart';
import 'package:vendor_app/presentation/screens/auth/payment/vendor_charges_screen.dart';
import 'package:vendor_app/presentation/screens/auth/register/vendor_register_screen.dart';
import 'package:vendor_app/presentation/screens/auth/tax_forms/tax_forms_screen.dart';

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
        GoRoute(
            path: PagePath.register,
            builder: (context, state) {
              return const VendorRegisterScreen();
            }),
        GoRoute(
            path: PagePath.vendorCharges,
            builder: (context, state) {
              return const VendorChargesScreen();
            }),
        GoRoute(
            path: PagePath.taxForm,
            builder: (context, state) {
              return const TaxFormScreen();
            }),
        GoRoute(
            path: PagePath.category,
            builder: (context, state) {
              return const CategoryScreen();
            }),
      ]);
}

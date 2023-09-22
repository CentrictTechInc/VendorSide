import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/presentation/screens/auth/login/controllers/login_controller.dart';
import 'package:vendor_app/presentation/screens/auth/otp/email_otp_screen.dart';
import 'package:vendor_app/presentation/screens/auth/otp/phone_otp_screen.dart';
import 'package:vendor_app/presentation/screens/auth/otp/register_otp_verification_screen.dart';
import 'package:vendor_app/presentation/screens/auth/register/controller/register_controller.dart';
import 'package:vendor_app/presentation/screens/bottom_nav_screen.dart';
import 'package:vendor_app/presentation/screens/business/business_screen.dart';
import 'package:vendor_app/presentation/screens/chat/inbox_screen.dart';
import 'package:vendor_app/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:vendor_app/presentation/screens/home/home_screen.dart';
import 'package:vendor_app/presentation/screens/notification/notification_screen.dart';
import 'package:vendor_app/presentation/screens/password_screens/create_new_password.dart';
import 'package:vendor_app/presentation/screens/password_screens/forgot_password_screen.dart';
import 'package:vendor_app/presentation/screens/profile_module/edit_screen.dart';
import 'package:vendor_app/presentation/screens/profile_module/profile_screen.dart';
import 'package:vendor_app/presentation/screens/review/review_screen.dart';
import 'package:vendor_app/presentation/screens/tasks/task_screen.dart';
import 'package:vendor_app/presentation/screens/vendor_category/category_screen.dart';
import 'package:vendor_app/presentation/screens/auth/login/login_screen.dart';
import 'package:vendor_app/presentation/screens/payment/vendor_charges_screen.dart';
import 'package:vendor_app/presentation/screens/auth/register/vendor_register_screen.dart';
import 'package:vendor_app/presentation/screens/tax_forms/tax_forms_screen.dart';

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
            return MainBottomNavScreen(
              widget: child,
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: PagePath.slash,
              builder: (context, state) {
                return const Scaffold(
                  body: Center(
                    child: CommonText(
                      text: "Welcome ",
                    ),
                  ),
                );
              },
              routes: const [],
            ),
            GoRoute(
              path: PagePath.notification,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                return NotificationScreen();
              },
            ),
            GoRoute(
              path: PagePath.inbox,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                return InboxScreen();
              },
            ),
            GoRoute(
              path: PagePath.business,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                return BusinessScreen();
              },
            ),
            GoRoute(
              path: PagePath.tasks,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) {
                return TasksScreen();
              },
            ),
            GoRoute(
                path: PagePath.homeScreen,
                parentNavigatorKey: _shellNavigatorKey,
                builder: (context, state) {
                  return const HomeScreen();
                },
                routes: [
                  GoRoute(
                      path: PagePath.profile,
                      builder: (context, state) {
                        return ProfileScreen();
                      },
                      routes: [
                        GoRoute(
                            path: PagePath.profileEdit,
                            builder: (context, state) {
                              return EditProfileScreen();
                            }),
                      ]),
                  GoRoute(
                      path: PagePath.contact,
                      builder: (context, state) {
                        return ContactUsScreen();
                      }),
                  GoRoute(
                      path: PagePath.review,
                      builder: (context, state) {
                        return ReviewScreen();
                      }),
                ])
          ],
        ),
        GoRoute(
            path: PagePath.login,
            builder: (context, state) {
              Get.lazyPut<LoginController>(() => LoginController());
              return const LoginScreen();
            }),
        GoRoute(
            path: PagePath.register,
            builder: (context, state) {
              Get.lazyPut<RegisterController>(() => RegisterController());
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
        GoRoute(
            path: PagePath.emailOtp,
            builder: (context, state) {
              return EmailOtpScreen();
            }),
        GoRoute(
            path: PagePath.mobileOtp,
            builder: (context, state) {
              return const NumberOtpScreen();
            }),
        GoRoute(
            path: PagePath.registerEmailOtp,
            builder: (context, state) {
              return RegisterEmailOtpScreen(
                email: '',
              );
            }),
        GoRoute(
            path: PagePath.forgotPasswrod,
            builder: (context, state) {
              return ForgotPasswordScreen();
            }),
        GoRoute(
            path: PagePath.createNewPassword,
            builder: (context, state) {
              return CreateNewPasswordScreen(
                email: '',
              );
            }),
      ]);
}

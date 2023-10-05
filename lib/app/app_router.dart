import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/presentation/screens/auth/controllers/login_controller.dart';
import 'package:vendor_app/presentation/screens/auth/controllers/otp_controller.dart';
import 'package:vendor_app/presentation/screens/auth/otp/email_otp_screen.dart';
import 'package:vendor_app/presentation/screens/auth/otp/phone_otp_screen.dart';
import 'package:vendor_app/presentation/screens/auth/otp/register_otp_verification_screen.dart';
import 'package:vendor_app/presentation/screens/auth/controllers/register_controller.dart';
import 'package:vendor_app/presentation/screens/bottom_nav/Main_screen.dart';
import 'package:vendor_app/presentation/screens/bottom_nav/controller/botton_nav_controller.dart';
import 'package:vendor_app/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:vendor_app/presentation/screens/manage_services/controller/manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/manage_services/manage_services_screen.dart';
import 'package:vendor_app/presentation/screens/password_screens/controllers/pass_controller.dart';
import 'package:vendor_app/presentation/screens/password_screens/create_new_password.dart';
import 'package:vendor_app/presentation/screens/password_screens/forgot_password_screen.dart';
import 'package:vendor_app/presentation/screens/profile_module/edit_screen.dart';
import 'package:vendor_app/presentation/screens/profile_module/profile_screen.dart';
import 'package:vendor_app/presentation/screens/review/review_screen.dart';
import 'package:vendor_app/presentation/screens/schedule/schedule_screen.dart';
import 'package:vendor_app/presentation/screens/tasks/controller/tasks_controller.dart';
import 'package:vendor_app/presentation/screens/tasks/task_screen.dart';
import 'package:vendor_app/presentation/screens/vendor_category/category_screen.dart';
import 'package:vendor_app/presentation/screens/auth/login/login_screen.dart';
import 'package:vendor_app/presentation/screens/payment/vendor_charges_screen.dart';
import 'package:vendor_app/presentation/screens/auth/register/vendor_register_screen.dart';
import 'package:vendor_app/presentation/screens/tax_forms/tax_forms_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final globalContext = _rootNavigatorKey.currentContext;

class AppRouter {
  static final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: PagePath.slash,
      routes: [
        GoRoute(
            path: PagePath.slash,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) {
              Get.lazyPut<BottomNavController>(() => BottomNavController());
              return MainBottomNavScreen();
            },
            routes: [
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
              GoRoute(
                  path: PagePath.schedule,
                  builder: (context, state) {
                    return ScheduleScreen();
                  }),
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
                path: PagePath.tasks,
                builder: (context, state) {
                  Get.lazyPut<TasksController>(() => TasksController());
                  return TasksScreen();
                },
              ),
              GoRoute(
                  path: PagePath.schedule,
                  builder: (context, state) {
                    return ScheduleScreen();
                  }),
              GoRoute(
                  path: PagePath.manageServices,
                  builder: (context, state) {
                    Get.lazyPut<ManageServicesController>(
                        () => ManageServicesController());

                    return ManageServicesScreen();
                  }),
            ]),
        GoRoute(
            path: PagePath.login,
            builder: (context, state) {
              Get.lazyPut<LoginController>(() => LoginController());
              Get.lazyPut<OtpController>(() => OtpController());
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
            path: "${PagePath.emailOtp}/:email",
            builder: (context, state) {
              String email = state.pathParameters['email'] as String;
              return EmailOtpScreen(
                email: email,
              );
            }),
        GoRoute(
            path: PagePath.mobileOtp,
            builder: (context, state) {
              return const NumberOtpScreen();
            }),
        GoRoute(
            path: "${PagePath.registerEmailOtp}/:email",
            builder: (context, state) {
              String email = state.pathParameters['email'] as String;
              Get.lazyPut<RegisterController>(() => RegisterController());
              Get.lazyPut<OtpController>(() => OtpController());

              return RegisterEmailOtpScreen(
                email: email,
              );
            }),
        GoRoute(
            path: PagePath.forgotPasswrod,
            builder: (context, state) {
              Get.lazyPut<PasswordController>(() => PasswordController());
              return ForgotPasswordScreen();
            }),
        GoRoute(
            path: PagePath.createNewPassword,
            builder: (context, state) {
              Get.lazyPut<PasswordController>(() => PasswordController());
              String email = state.pathParameters['email'] as String;
              return CreateNewPasswordScreen(
                email: email,
              );
            }),
      ]);
}
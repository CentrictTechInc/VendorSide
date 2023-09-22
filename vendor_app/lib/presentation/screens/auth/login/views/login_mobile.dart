import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
// import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/presentation/screens/auth/login/controllers/login_controller.dart';

class LoginMobile extends StatelessWidget with FieldsValidation {
  bool obscure = false;

  LoginMobile({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        // dispose: (state) => state.dispose(),
        builder: (controller) {
          return Container(
            decoration: const BoxDecoration(
                color: AppColors.primary,
                image: DecorationImage(
                    image: AssetImage(Drawables.logoBackground),
                    fit: BoxFit.fitWidth)),
            width: context.width,
            child: SingleChildScrollView(
              child: Form(
                key: loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.width,
                      child: Column(
                        children: [
                          VerticalSpacing(10.h),
                          Image.asset(Drawables.logo, height: 100),
                          VerticalSpacing(7.5.h),
                          Obx(() {
                            return CommonText(
                              text: "VENDOR LOGIN ${controller.count.value}",
                              color: AppColors.white,
                              fontSize: 20.sp,
                              weight: FontWeight.w600,
                              letterSpacing: 1.1,
                            );
                          }),
                          VerticalSpacing(4.5.h),
                          Container(
                            constraints: BoxConstraints(
                                minHeight: context.height -
                                    (10.h + 85 + 7.5.h + 4.5.h + 57.5)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            decoration: const BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Column(
                              children: [
                                CommonTextField(
                                  controller: emailController,
                                  hintText: 'Email',
                                  validator: validateEmail,
                                  suffix: const ImageIcon(
                                    AssetImage(RGIcons.email),
                                    color: AppColors.grey,
                                  ),
                                ),
                                const VerticalSpacing(20),
                                Obx(() {
                                  return CommonTextField(
                                    controller: passController,
                                    hintText: 'Password',
                                    validator: passwordValidation,
                                    pass: controller.passToggle.value,
                                    suffix: InkWell(
                                      onTap: () {
                                        controller.increment();

                                        controller.passwordToggle();
                                      },
                                      child: ImageIcon(
                                        AssetImage(controller.passToggle.value
                                            ? RGIcons.lock
                                            : RGIcons.unlock),
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  );
                                }),
                                const VerticalSpacing(40),
                                InkWell(
                                  onTap: () =>
                                      context.push(PagePath.forgotPasswrod),
                                  child: CommonText(
                                    text: 'Forgot Password?',
                                    color: AppColors.primary,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                const VerticalSpacing(50),
                                CommonTextButton(
                                    onPressed: () async {
                                      context.go(PagePath.homeScreen);
                                      // if (loginFormKey.currentState!.validate()) {}
                                    },
                                    color: AppColors.white,
                                    text: "LOG IN"),
                                const VerticalSpacing(30),
                                RichText(
                                  text: TextSpan(
                                      text: "You don't have an account? ",
                                      style: const TextStyle(
                                          fontFamily: "Sora",
                                          color: AppColors.grey,
                                          letterSpacing: 1.1),
                                      children: [
                                        TextSpan(
                                          text: "Sign Up",
                                          style: const TextStyle(
                                              color: AppColors.primary,
                                              fontFamily: "Sora"),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.go(PagePath.register);
                                            },
                                        )
                                      ]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_back_button.dart';
import 'package:vendor_app/app/utils/common_number_testfield.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class ForgotPasswordScreen extends StatelessWidget with FieldsValidation {
  ForgotPasswordScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const VerticalSpacing(30),
                  const Align(
                      alignment: Alignment.topLeft, child: CommonBackButton()),
                  const VerticalSpacing(50),
                  CommonText(
                    text: 'Forgot Password',
                    weight: FontWeight.bold,
                    fontSize: 25.sp,
                  ),
                  const VerticalSpacing(50),
                  SizedBox(
                    width: 65.w,
                    child: CommonText(
                      textAlign: TextAlign.center,
                      text:
                          "Please enter your email/mobile below and we will send you the OTP code",
                      fontSize: 11.sp,
                      weight: FontWeight.w300,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const VerticalSpacing(30),
                  CommonTextField(
                    controller: email,
                    hintText: 'Email',
                    validator: validateEmail,
                    enableBorder: AppColors.grey,
                    textColor: AppColors.primaryText,
                    borderColor: AppColors.grey,
                    hintColor: AppColors.grey,
                    cursorColor: AppColors.grey,
                    suffix: const ImageIcon(
                      AssetImage(RGIcons.email),
                      color: AppColors.grey,
                    ),
                  ),
                  const VerticalSpacing(25),
                  const Center(
                    child: CommonText(
                      text: "Or",
                      fontSize: 20,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const VerticalSpacing(25),
                  CommonMobileTextFeild(
                    controller: phone,
                    validator: validatePhone,
                    countryCodeColor: AppColors.grey,
                  ),
                  const VerticalSpacing(70),
                  CommonTextButton(
                    onPressed: () {
                      if (validateEmail(email.text) == null) {}
                    },
                    text: 'Send'.toUpperCase(),
                    color: AppColors.white,
                    backgroundColor: AppColors.primary,
                  ),
                  const VerticalSpacing(40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

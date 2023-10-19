import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_back_button.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/presentation/screens/auth/controllers/otp_controller.dart';
import 'package:vendor_app/presentation/screens/auth/controllers/register_controller.dart';
import 'package:vendor_app/presentation/screens/home/components/confirmation_dialogue.dart';

class RegisterEmailOtpScreen extends StatelessWidget {
  RegisterEmailOtpScreen({super.key, required this.email});
  final String email;
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool closeConfirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CloseConfirmationDialogue();
          },
        );
        return closeConfirmed;
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const VerticalSpacing(30),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CommonBackButton(),
                  ),
                  const VerticalSpacing(50),
                  CommonText(
                    text: 'Email Verification',
                    fontSize: 25.sp,
                    weight: FontWeight.bold,
                  ),
                  const VerticalSpacing(40),
                  SizedBox(
                    width: 65.w,
                    child: CommonText(
                      text:
                          "We sent the OTP code to your email, please check it and enter below",
                      fontSize: 11.sp,
                      weight: FontWeight.w300,
                      color: AppColors.secondaryText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontFamily: "Sora",
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold),
                      obscureText: false,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 4) {
                          return "Invalid OTP";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        activeColor: AppColors.primary,
                        borderWidth: 1.0,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: Responsive.isDesktop(context) ? 90 : 65,
                        fieldWidth: Responsive.isDesktop(context) ? 90 : 65,
                        selectedFillColor: AppColors.white,
                        errorBorderColor: AppColors.red,
                        selectedColor: AppColors.primary,
                        inactiveColor: AppColors.white,
                        activeFillColor: AppColors.white,
                        inactiveFillColor: AppColors.greyish,
                      ),
                      cursorColor: AppColors.secondary,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      enablePinAutofill: true,
                      controller: pinController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                      onChanged: (String value) {},
                    ),
                  ),
                  VerticalSpacing(10.h),
                  GetBuilder<RegisterController>(
                      init: RegisterController(),
                      builder: (controller) {
                        return CommonTextButton(
                          onPressed: () async {
                            if (pinController.text.isNotEmpty) {
                              await controller.registerEmailOtp(
                                  email, pinController.text);
                            } else {
                              ToastMessage.message("Input OTP");
                            }
                          },
                          text: 'VERIFY',
                          color: AppColors.white,
                          backgroundColor: AppColors.primary,
                        );
                      }),
                  const VerticalSpacing(40),
                  GetBuilder<OtpController>(
                      init: OtpController(),
                      builder: (con) {
                        return RichText(
                          text: TextSpan(
                              text: 'Didn\'t recieve any code? ',
                              style: const TextStyle(color: AppColors.grey),
                              children: [
                                TextSpan(
                                  text: con.enableResend
                                      ? 'Resend'
                                      : '(${con.secondsRemaining})',
                                  style:
                                      const TextStyle(color: AppColors.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      con.enableResend
                                          ? con.resendCode(email)
                                          : null;
                                    },
                                )
                              ]),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

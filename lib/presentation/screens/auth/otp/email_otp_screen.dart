import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_back_button.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/auth/controllers/otp_controller.dart';
import 'package:vendor_app/presentation/screens/auth/controllers/register_controller.dart';

class EmailOtpScreen extends StatefulWidget {
  EmailOtpScreen({required this.email});
  final String email;
  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  final TextEditingController pinController = TextEditingController();

  int secondsRemaining = 30;

  bool enableResend = false;

  Timer? timer;

  String? email;

  void _resendCode() {
    final c = Get.find<OtpController>();
    c.forgotPassword(widget.email);

    // ref.read(authNotifierProvider.notifier).forgot(widget.email);
    // setState(() {
    secondsRemaining = 30;
    enableResend = false;
    // });
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // heightFactor: ,
                ),
                const VerticalSpacing(50),
                CommonText(
                  text: 'Forgot Email Verification',
                  fontSize: 25.sp,
                  textAlign: TextAlign.center,
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
                    onSubmitted: (value) {},
                  ),
                ),
                VerticalSpacing(10.h),
                GetBuilder<RegisterController>(
                    init: RegisterController(),
                    builder: (controller) {
                      return CommonTextButton(
                        onPressed: () {
                          // print(PagePath.createNewPassword);
                          // context.push(PagePath.createNewPassword);
                          if (pinController.text.isNotEmpty) {
                            controller.registerEmailOtp(
                                widget.email, pinController.text);
                          }
                        },
                        text: 'VERIFY',
                        color: AppColors.white,
                        backgroundColor: AppColors.primary,
                      );
                    }),
                const VerticalSpacing(40),
                RichText(
                  text: TextSpan(
                      text: 'Didn\'t recieve any code? ',
                      style: const TextStyle(color: AppColors.grey),
                      children: [
                        TextSpan(
                          text: enableResend ? 'Resend' : '($secondsRemaining)',
                          style: const TextStyle(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              enableResend ? _resendCode() : null;
                            },
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

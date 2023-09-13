import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_back_button.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';

class CreateNewPasswordScreen extends StatelessWidget with FieldsValidation {
  bool enable = true;

  CreateNewPasswordScreen({super.key, required this.email});
  final String email;
  final GlobalKey<FormState> passForm = GlobalKey();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
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
              child: Form(
                key: passForm,
                child: Column(
                  children: [
                    const VerticalSpacing(30),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: CommonBackButton(),
                    ),
                    const VerticalSpacing(50),
                    CommonText(
                      text: 'Create New Password'.toUpperCase(),
                      weight: FontWeight.bold,
                      fontSize: 25.sp,
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacing(30),
                    SizedBox(
                      width: 65.w,
                      child: CommonText(
                        text:
                            "And now, you can create the new password and confirm it",
                        fontSize: 11.sp,
                        color: AppColors.grey,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const VerticalSpacing(30),
                    CommonTextField(
                      controller: newPassController,
                      hintText: 'New Password',
                      enableBorder: AppColors.grey,
                      textColor: AppColors.primaryText,
                      borderColor: AppColors.grey,
                      validator: passwordValidation,
                      hintColor: AppColors.grey,
                      cursorColor: AppColors.grey,
                      pass: enable,
                      suffix: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: ImageIcon(
                          AssetImage(
                            enable ? RGIcons.eyeSlash : RGIcons.eyeVisibility,
                          ),
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    const VerticalSpacing(40),
                    CommonTextField(
                      controller: confirmPassController,
                      hintText: 'Confirm Password',
                      enableBorder: AppColors.grey,
                      textColor: AppColors.primaryText,
                      validator: (p0) => matchPass(p0, newPassController.text),
                      borderColor: AppColors.grey,
                      hintColor: AppColors.grey,
                      cursorColor: AppColors.grey,
                      pass: enable,
                      suffix: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: ImageIcon(
                          AssetImage(
                            enable ? RGIcons.eyeSlash : RGIcons.eyeVisibility,
                          ),
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    VerticalSpacing(15.h),
                    CommonTextButton(
                      onPressed: () {
                        context.go(PagePath.login);

                        if (passForm.currentState!.validate()) {
                        } else {
                          ToastMessage.message("Passwords deos not match!");
                        }
                      },
                      text: 'Save'.toUpperCase(),
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
      ),
    );
  }
}

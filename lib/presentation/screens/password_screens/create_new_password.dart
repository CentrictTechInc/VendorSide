import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_back_button.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/presentation/screens/password_screens/controllers/pass_controller.dart';

class CreateNewPasswordScreen extends StatelessWidget with FieldsValidation {
  CreateNewPasswordScreen({super.key, required this.email});
  final String email;
  final controller = Get.find<PasswordController>();
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
                key: controller.passForm,
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
                    Obx(() {
                      return CommonTextField(
                        controller: controller.newPassController,
                        hintText: 'New Password',
                        enableBorder: AppColors.grey,
                        textColor: AppColors.primaryText,
                        borderColor: AppColors.grey,
                        validator: passwordValidation,
                        hintColor: AppColors.grey,
                        cursorColor: AppColors.grey,
                        pass: controller.obscure.value,
                        suffix: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            controller.obscure.toggle();
                          },
                          child: ImageIcon(
                            AssetImage(
                              controller.obscure.value
                                  ? RGIcons.eyeSlash
                                  : RGIcons.eyeVisibility,
                            ),
                            color: AppColors.grey,
                          ),
                        ),
                      );
                    }),
                    const VerticalSpacing(40),
                    Obx(() {
                      return CommonTextField(
                        controller: controller.confirmPassController,
                        hintText: 'Confirm Password',
                        enableBorder: AppColors.grey,
                        textColor: AppColors.primaryText,
                        validator: (p0) =>
                            matchPass(p0, controller.newPassController.text),
                        borderColor: AppColors.grey,
                        hintColor: AppColors.grey,
                        cursorColor: AppColors.grey,
                        pass: controller.obscure.value,
                        suffix: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            controller.obscure.toggle();
                          },
                          child: ImageIcon(
                            AssetImage(
                              controller.obscure.value
                                  ? RGIcons.eyeSlash
                                  : RGIcons.eyeVisibility,
                            ),
                            color: AppColors.grey,
                          ),
                        ),
                      );
                    }),
                    VerticalSpacing(15.h),
                    CommonTextButton(
                      onPressed: () {
                        if (controller.passForm.currentState!.validate()) {
                          controller.changeNewPassword(
                            email,
                          );
                        } else {
                          ToastMessage.message("Passwords does not match!");
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

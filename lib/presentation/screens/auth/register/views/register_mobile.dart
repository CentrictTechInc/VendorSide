import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/utils/common_number_testfield.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/presentation/screens/auth/controllers/register_controller.dart';

class RegisterMobile extends StatelessWidget with FieldsValidation {
  RegisterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primary,
          image: DecorationImage(
              image: AssetImage(Drawables.logoBackground),
              fit: BoxFit.fitWidth)),
      width: context.width,
      child: SingleChildScrollView(
        child: GetBuilder<RegisterController>(builder: (controller) {
          return Form(
            key: controller.signUpForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerticalSpacing(7.5.h),
                const CommonText(
                  text: "SIGN UP",
                  weight: FontWeight.w600,
                  color: AppColors.white,
                ),
                VerticalSpacing(7.5.h),
                Container(
                  constraints: BoxConstraints(minHeight: context.height - 250),
                  width: context.width,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      const VerticalSpacing(20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: CommonText(
                          text: Strings.signUpNotice,
                          fontSize: 15,
                          textAlign: TextAlign.center,
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: CommonText(
                          text: Strings.signupInfo,
                          fontSize: 12,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const VerticalSpacing(40),
                      CommonTextField(
                        controller: controller.registerModel.vendorCompanyName,
                        hintText: 'Company Name',
                        validator: emptyFieldValidation,
                        suffix: const ImageIcon(
                          AssetImage(RGIcons.building),
                          size: 20,
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(20),
                      CommonTextField(
                        controller: controller.registerModel.vendoraddress,
                        hintText: 'Street Address',
                        validator: emptyFieldValidation,
                        suffix: InkWell(
                          onTap: () {
                            controller.getAddress();
                          },
                          child: const ImageIcon(
                            AssetImage(RGIcons.route),
                            size: 20,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const VerticalSpacing(20),
                      CommonTextField(
                        controller: controller.registerModel.vendorCity,
                        hintText: 'City',
                        validator: emptyFieldValidation,
                        suffix: const ImageIcon(
                          AssetImage(RGIcons.location),
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(20),
                      CommonTextField(
                        controller: controller.registerModel.vendorRegion,
                        hintText: 'State/Region',
                        validator: emptyFieldValidation,
                        suffix: const ImageIcon(
                          AssetImage(RGIcons.map),
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(20),
                      CommonTextField(
                        controller: controller.registerModel.vendorPostalcode,
                        hintText: 'Zip/Postal code',
                        validator: zipCodeOptionalValidation,
                        suffix: const ImageIcon(
                          AssetImage(RGIcons.mailBox),
                          size: 20,
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(20),
                      CommonMobileTextFeild(
                        controller: controller.registerModel.vendorMobileDetail,
                        validator: validatePhone,
                        borderColor: AppColors.grey,
                        countryCodeColor: AppColors.grey,
                        cursorColor: AppColors.grey,
                        hintColor: AppColors.grey,
                        iconColor: AppColors.grey,
                        lineColor: AppColors.grey,
                      ),
                      const VerticalSpacing(20),
                      CommonTextField(
                        controller: controller.registerModel.firstName,
                        hintText: 'First Name',
                        validator: emptyFieldValidation,
                        suffix: const ImageIcon(
                          AssetImage(RGIcons.account),
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(20),
                      CommonTextField(
                        controller: controller.registerModel.lastName,
                        hintText: 'Last Name',
                        validator: emptyFieldValidation,
                        suffix: const ImageIcon(
                          AssetImage(RGIcons.account),
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(20),
                      CommonTextField(
                        controller: controller.registerModel.jobTitle,
                        hintText: 'Job Title',
                        validator: emptyFieldValidation,
                        suffix: const ImageIcon(
                          AssetImage(RGIcons.suitcase),
                          size: 20,
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(20),
                      CommonTextField(
                        controller: controller.registerModel.vendoremail,
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
                          controller: controller.registerModel.vendorPassword,
                          hintText: 'Password',
                          validator: passwordValidation,
                          pass: controller.obscure.value,
                          suffix: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              controller.obscure.toggle();
                            },
                            child: ImageIcon(
                              AssetImage(controller.obscure.value
                                  ? RGIcons.lock
                                  : RGIcons.unlock),
                              color: AppColors.grey,
                            ),
                          ),
                        );
                      }),
                      VerticalSpacing(8.h),
                      CommonTextButton(
                          onPressed: () {
                            // context.go(PagePath.vendorCharges);

                            if (controller.signUpForm.currentState!
                                .validate()) {
                              controller.register();
                            }
                          },
                          backgroundColor: AppColors.primary,
                          color: AppColors.background,
                          text: 'SIGN UP '),
                      const VerticalSpacing(40),
                      RichText(
                        text: TextSpan(
                            text: 'Already have an account? ',
                            style: const TextStyle(color: AppColors.grey),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style:
                                    const TextStyle(color: AppColors.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    LocalStorageService.instance.logoutUser();
                                    context.go(PagePath.login);
                                  },
                              )
                            ]),
                      ),
                      const VerticalSpacing(20),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

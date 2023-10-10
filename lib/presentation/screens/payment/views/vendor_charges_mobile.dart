import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/resources/strings.dart';

class VendorChargesMobile extends StatelessWidget with FieldsValidation {
  const VendorChargesMobile({super.key});

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
          child: Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          VerticalSpacing(7.5.h),
          const CommonText(
            text: "SIGN UP CHARGES",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacing(20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: CommonText(
                    text: Strings.signupCharges,
                    fontSize: 15,
                    textAlign: TextAlign.center,
                    color: AppColors.grey,
                  ),
                ),
                const VerticalSpacing(30),
                Container(
                  height: 185,
                  width: 380,
                  decoration: BoxDecoration(
                      color: AppColors.greyish,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonText(
                          text: "Total Payment",
                          fontSize: 14,
                          weight: FontWeight.w700),
                      VerticalSpacing(15),
                      CommonText(
                        text: "\$149.99",
                        fontSize: 48,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(30),
                CommonText(
                  text: "Payment Methods",
                  fontSize: 11.sp,
                  weight: FontWeight.bold,
                ),
                const VerticalSpacing(10),
                Row(
                  children: [
                    CommonText(
                      text: "Accepted form of payment: ",
                      fontSize: 8.sp,
                      textAlign: TextAlign.left,
                    ),
                    const Spacer(),
                    Image.asset(
                      Drawables.cards,
                      height: 20,
                    )
                  ],
                ),
                const VerticalSpacing(20),
                CommonTextField(
                  controller: TextEditingController(),
                  hintText: 'Name on Card',
                  validator: emptyFieldValidation,
                ),
                const VerticalSpacing(20),
                CommonTextField(
                  controller: TextEditingController(),
                  hintText: 'Card number',
                  validator: emptyFieldValidation,
                ),
                const VerticalSpacing(50),
                Align(
                  alignment: Alignment.center,
                  child: CommonTextButton(
                      onPressed: () {
                        context.push(PagePath.taxForm);
                      },
                      backgroundColor: AppColors.primary,
                      color: AppColors.background,
                      text: 'PAY'),
                ),
                const VerticalSpacing(40),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}

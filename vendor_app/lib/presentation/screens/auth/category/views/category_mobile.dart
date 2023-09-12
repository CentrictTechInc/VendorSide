import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/presentation/screens/auth/category/components/category_container.dart';

class CategoryMobile extends StatelessWidget with FieldsValidation {
  const CategoryMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primary,
          image: DecorationImage(
              image: AssetImage(Drawables.logoBackground),
              fit: BoxFit.fitWidth)),
      width: context.width,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        VerticalSpacing(7.5.h),
        const CommonText(
          text: "Select your Category",
          weight: FontWeight.w600,
          color: AppColors.white,
        ),
        VerticalSpacing(7.5.h),
        Container(
          constraints: BoxConstraints(minHeight: context.height - 201),
          width: context.width,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
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
              CategoryContainer(
                label: "Automotive",
                icon: RGIcons.fancyCar,
              ),
              const VerticalSpacing(30),
              CategoryContainer(
                label: "Home Improvement",
                icon: RGIcons.homeService,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/handyman_warranty_screen.dart';
import 'package:vendor_app/presentation/screens/vendor_category/components/category_container.dart';

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
        Expanded(
          child: Container(
            constraints: BoxConstraints(minHeight: context.height - 23.h),
            width: context.width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const VerticalSpacing(20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: CommonText(
                    text: Strings.categoryText,
                    fontSize: 15,
                    textAlign: TextAlign.center,
                    color: AppColors.grey,
                  ),
                ),
                const VerticalSpacing(30),
                CategoryContainer(
                  label: "Automotives",
                  icon: RGIcons.fancyCar,
                  onTap: () {
                    context.push(PagePath.vendorCharges);
                  },
                ),
                const VerticalSpacing(60),
                CategoryContainer(
                  label: "Home Improvement",
                  icon: RGIcons.homeService,
                  onTap: () {
                    Get.lazyPut<ServiceController>(() => ServiceController());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HandymanWarrantyScreen(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

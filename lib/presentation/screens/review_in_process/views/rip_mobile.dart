import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';

class RIPMobile extends StatelessWidget {
  const RIPMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(maxHeight: context.height),
      child: Column(
        children: [
          const VerticalSpacing(100),
          CommonText(
              text: "REVIEWING PROFILE",
              fontSize: 22.sp,
              weight: FontWeight.bold,
              textAlign: TextAlign.center),
          const VerticalSpacing(30),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: context.height * 0.18),
            child: Image.asset(
              Drawables.timeScaleGif,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
            ),
          ),
          const VerticalSpacing(50),
          CommonText(
            text: "Thank you for submitting your account",
            fontSize: 18.sp,
            maxLines: 2,
            weight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          const VerticalSpacing(50),
          CommonText(
            text:
                "We are verrifying your account You will be notified once your account is approved",
            fontSize: 14.sp,
            color: AppColors.grey,
            textAlign: TextAlign.center,
          ),
          // const VerticalSpacing(50),
          const Spacer(),
          CommonTextButton(
              onPressed: () async {
                context.go(PagePath.login);
                LocalStorageService.instance.logoutUser();
              },
              color: AppColors.white,
              text: "LOG OUT"),
          const VerticalSpacing(40),
        ],
      ),
    );
  }
}

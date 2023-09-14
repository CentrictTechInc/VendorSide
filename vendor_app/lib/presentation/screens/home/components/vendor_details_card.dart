import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

class VendorDetailsCard extends StatelessWidget {
  const VendorDetailsCard({
    super.key,
    required this.amount,
    required this.icon,
    required this.subTitle,
  });

  final String amount;
  final String icon;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonText(
                text: "\n$amount".toUpperCase(),
                color: AppColors.primaryText,
                letterSpacing: .1,
                maxLines: 2,
                fontSize: 20,
                weight: FontWeight.w600,
              ),
              const Spacer(),
              Image.asset(
                icon,
                height: 30,
                width: 30,
              ),
            ],
          ),
          const VerticalSpacing(20),
          CommonText(
            text: subTitle,
            color: AppColors.primaryText,
            fontSize: 8.5.sp,
            letterSpacing: .1,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
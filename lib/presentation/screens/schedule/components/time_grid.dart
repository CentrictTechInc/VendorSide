import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

class TimeGridChild extends StatelessWidget {
  const TimeGridChild({
    super.key,
    required this.time,
    required this.selected,
    required this.onTap,
  });

  final String time;
  final bool selected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: selected,
      replacement: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondary),
        child: Center(
          child: CommonText(
            text: time,
            fontSize: 10.sp,
            color: AppColors.white,
          ),
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.greyish,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: CommonText(
              text: time,
              fontSize: 10.sp,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

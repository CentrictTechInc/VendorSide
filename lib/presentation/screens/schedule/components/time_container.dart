import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer(
      {this.canEdit = false,
      this.onUpPressed,
      this.onDownPressed,
      this.timeText = '',
      super.key});
  final bool canEdit;
  final VoidCallback? onUpPressed;
  final VoidCallback? onDownPressed;
  final String timeText;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 40.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.greyish,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: AppColors.grey,
            ),
            onPressed: canEdit ? onDownPressed : null,
          ),
          const HorizontalSpacing(10),
          Expanded(
              child: CommonText(
            text: timeText,
            fontSize: 8.sp,
          )),
          const HorizontalSpacing(10),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_up,
              size: 20,
              color: AppColors.grey,
            ),
            onPressed: canEdit ? onUpPressed : null,
          ),
        ],
      ),
    );
  }
}

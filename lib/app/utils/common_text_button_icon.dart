import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

class CommonIconTextButton extends StatelessWidget {
  const CommonIconTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.backgroundColor = AppColors.primary,
    this.animationDuration,
    this.alignment,
    this.width = 60,
    this.elevation = 2,
    this.color = AppColors.primaryText,
    this.fontSize,
    this.iconSize,
    this.position = true,
  });
  final VoidCallback onPressed;
  final Duration? animationDuration;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final double width;
  final String text;
  final Color color;
  final double elevation;
  final double? fontSize;
  final double? iconSize;
  final IconData icon;
  final bool position;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          animationDuration: animationDuration,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!position) ...[
              Icon(
                icon,
                color: color,
                size: iconSize ?? 18.0,
              ),
              const HorizontalSpacing(5.0),
            ],
            CommonText(
              text: text,
              fontSize: fontSize ?? 14.sp,
              weight: FontWeight.w600,
              color: color,
            ),
            if (position) ...[
              const HorizontalSpacing(5.0),
              Icon(
                icon,
                color: color,
                size: iconSize ?? 18.0,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

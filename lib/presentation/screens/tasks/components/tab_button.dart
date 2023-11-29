import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

class TabButton extends StatelessWidget {
  final String name;
  bool highlighted;
  VoidCallback? onPressed;
  double minWidth;
  double? fontSize;
  double? height;
  double? radius;
  double? padding;

  TabButton(
      {super.key,
      this.fontSize,
      this.height,
      this.padding,
      required this.name,
      this.onPressed,
      this.radius,
      this.minWidth = 200,
      this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 30,
      padding: EdgeInsets.symmetric(horizontal: padding ?? 10),
      constraints: BoxConstraints(minWidth: (minWidth)),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor:
                highlighted ? AppColors.primary : AppColors.whiteGreyish,
            padding: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  radius ?? 8.0), // Adjust the value as needed
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: onPressed,
        child: CommonText(
          text: name.toString(),
          fontSize: fontSize ?? 13,
          weight: FontWeight.w500,
          color: highlighted ? AppColors.white : AppColors.grey,
        ),
      ),
    );
  }
}

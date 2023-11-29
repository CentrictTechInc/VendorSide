import 'package:flutter/material.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:sizer/sizer.dart';
import 'common_spacing.dart';
import 'common_text.dart';

// ignore: must_be_immutable
class DrawerItem extends StatelessWidget {
  DrawerItem({
    super.key,
    required this.text,
    required this.location,
    this.highlighted = false,
    required this.icon,
    this.onTap,
  });
  final String text;
  final String location;
  final String icon;
  bool highlighted;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: highlighted ? AppColors.greyish : AppColors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const HorizontalSpacing(5),
            ImageIcon(
              AssetImage(icon),
              color:
                  highlighted ? AppColors.primaryText : AppColors.primaryText,
              size: 25,
            ),
            const HorizontalSpacing(15),
            CommonText(
              text: text,
              fontSize: 11.sp,
              weight: FontWeight.w600,
              color:
                  highlighted ? AppColors.primaryText : AppColors.primaryText,
            ),
          ],
        ),
      ),
    );
  }
}

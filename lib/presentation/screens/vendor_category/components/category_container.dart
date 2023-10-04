import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

class CategoryContainer extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const CategoryContainer(
      {super.key,
      required this.onTap,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      decoration: BoxDecoration(
        color: AppColors.greyish,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const VerticalSpacing(20),
          GestureDetector(
            onTap: onTap,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 80,
                width: 100,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(.1),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
                child: ImageIcon(
                  AssetImage(icon),
                  color: AppColors.black,
                  size: 50,
                ),
              ),
            ),
          ),
          const VerticalSpacing(15),
          CommonText(
            text: label,
            color: AppColors.black,
            fontSize: 14,
            weight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          const VerticalSpacing(20),
        ],
      ),
    );
  }
}

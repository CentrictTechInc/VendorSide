import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

// ignore: must_be_immutable
class CommonTextRow extends StatelessWidget {
  CommonTextRow(
      {this.extraText = '', required this.text, required this.icon, super.key});
  String icon;
  String text;
  String extraText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(AssetImage(icon)),
        const HorizontalSpacing(10),
        CommonText(
          text: text,
          fontSize: 14,
          weight: FontWeight.w600,
        ),
        if (extraText.isNotEmpty) ...[
          const HorizontalSpacing(10),
          CommonText(
            text: extraText,
            fontSize: 10,
            color: AppColors.grey,
          ),
        ],
      ],
    );
  }
}

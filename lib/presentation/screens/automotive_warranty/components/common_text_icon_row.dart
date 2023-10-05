import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

// ignore: must_be_immutable
class CommonTextRow extends StatelessWidget {
  CommonTextRow(
      {this.expanded = false,
      this.extraText = '',
      required this.text,
      required this.icon,
      this.onPressed,
      super.key});
  bool expanded;
  String icon;
  String text;
  String extraText;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        const Spacer(),
        IconButton(
            onPressed: onPressed,
            splashRadius: 10,
            icon: Icon(
              expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColors.grey,
            )),
      ],
    );
  }
}

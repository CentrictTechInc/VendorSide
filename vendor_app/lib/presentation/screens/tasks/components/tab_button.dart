import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

class TabButton extends StatelessWidget {
  final String name;
  final bool highlighted;
  final VoidCallback onPressed;

  const TabButton(
      {super.key,
      required this.name,
      required this.onPressed,
      this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: (context.width / 4) - 10),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor:
                highlighted ? AppColors.secondary : AppColors.whiteGreyish,
            padding: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Adjust the value as needed
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: onPressed,
        child: CommonText(
          text: name.toString(),
          fontSize: 13,
          weight: FontWeight.w500,
          color: highlighted ? AppColors.white : AppColors.grey,
        ),
      ),
    );
  }
}

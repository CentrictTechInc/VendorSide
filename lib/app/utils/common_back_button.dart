import 'package:flutter/material.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.maybePop(context),
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.greyish,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.asset(
          RGIcons.back,
          height: 20,
        ),
      ),
    );
  }
}

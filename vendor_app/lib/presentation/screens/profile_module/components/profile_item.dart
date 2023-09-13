import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:sizer/sizer.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.heading,
    this.text = "",
    required this.icon,
    this.isTextFields = false,
    this.readOnly = false,
    this.hintText = '',
    this.controller,
    this.maxLines = 2,
    this.height,
    this.validator,
    this.minLines = 1,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.ishighLight = true,
  });
  final String heading;
  final String text;
  final String icon;
  final bool isTextFields;
  final int? maxLines;
  final double? height;
  final int minLines;

  final String? Function(String?)? validator;

  final bool readOnly;
  final String hintText;
  final bool ishighLight;
  final TextEditingController? controller;
  final AutovalidateMode autoValidateMode;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          AssetImage(
            icon,
          ),
          color: AppColors.primary,
          size: 25.sp,
        ),
        const HorizontalSpacing(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: heading,
              fontSize: 10.sp,
              color: AppColors.grey,
            ),
            if (!isTextFields) const VerticalSpacing(5),
            SizedBox(
              height: height,
              width: context.width - 100,
              child: isTextFields
                  ? CommonTextField(
                      validator: validator,
                      maxLines: maxLines,
                      readOnly: readOnly,
                      contentPadding: const EdgeInsets.only(top: 5),
                      prefixPadding: 0,
                      suffixPadding: 0,
                      minLines: minLines,
                      autoValidateMode: autoValidateMode,
                      hintText: hintText,
                      controller: controller ?? TextEditingController(),
                      hintColor: AppColors.primaryText,
                      borderColor: AppColors.black,
                      enableBorder: AppColors.primaryText,
                      textColor: AppColors.primaryText,
                      cursorColor: AppColors.primaryText,
                    )
                  : CommonText(
                      text: text,
                      fontSize: 13.sp,
                      textOverflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      weight: FontWeight.w500,
                      color: ishighLight
                          ? AppColors.primaryText
                          : const Color.fromARGB(255, 144, 152, 162),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}

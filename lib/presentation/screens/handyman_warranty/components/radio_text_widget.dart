import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

// ignore: must_be_immutable
class RadioTextWidget extends StatelessWidget {
  RadioTextWidget({
    super.key,
    this.text,
    this.onChanged,
    this.selectedValue,
    this.isCheckBox = false,
    this.value = '',
    this.checkBoxvalue = false,
    this.isChanged,
  });
  String? text;
  String? selectedValue;
  String value;
  bool checkBoxvalue;
  bool isCheckBox;

  Function(String?)? onChanged;
  Function(bool?)? isChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonText(
            text: text ?? "12 Months / 12,000 Miles",
            color: selectedValue == value || checkBoxvalue
                ? AppColors.primary
                : AppColors.grey,
            fontSize: 11.sp,
          ),
        ),
        isCheckBox
            ? SizedBox(
                height: 20,
                child: Checkbox(
                  value: checkBoxvalue,
                  activeColor: AppColors.primary,
                  splashRadius: 20,
                  onChanged: isChanged,
                ),
              )
            : Radio<String>(
                value: value,
                groupValue: selectedValue,
                activeColor: AppColors.primary,
                focusColor: AppColors.primary,
                splashRadius: 20,
                // fillColor: MaterialStateProperty.all(AppColors.primary),
                onChanged: onChanged,
              ),
        const HorizontalSpacing(5)
      ],
    );
  }
}

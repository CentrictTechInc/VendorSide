import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';

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
        CommonText(
          text: text ?? "12 Months / 12,000 Miles",
          color: selectedValue == value || checkBoxvalue
              ? AppColors.primary
              : AppColors.grey,
          fontSize: 12,
        ),
        const Spacer(),
        isCheckBox
            ? Checkbox(
                shape: CircleBorder(),
                value: checkBoxvalue,
                activeColor: AppColors.primary,
                splashRadius: 20,
                onChanged: isChanged,
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

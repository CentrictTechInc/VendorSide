import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';

// ignore: must_be_immutable
class PriceWidget extends StatelessWidget with FieldsValidation {
  PriceWidget(
      {super.key,
      this.readOnly = false,
      this.text,
      this.controller,
      this.price,
      this.onChanged,
      this.color});
  TextEditingController? controller;
  bool readOnly;
  String? text;
  String? price;
  Color? color;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.,
      children: [
        const CommonText(
          text: "\n\$",
          fontSize: 18,
          weight: FontWeight.w500,
        ),
        const HorizontalSpacing(6),
        Column(
          children: [
            CommonText(
              text: text ?? "Service Charges",
              fontSize: 11,
            ),
            const VerticalSpacing(6),
            Container(
              width: 35.w,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color ?? Colors.white),
              child: Center(
                child: readOnly
                    ? CommonText(
                        text: price ?? "",
                        fontSize: 14,
                        weight: FontWeight.w600)
                    : CommonTextField(
                        onChanged: onChanged,
                        inputType: TextInputType.number,
                        borderColor: AppColors.white,
                        disableBorder: AppColors.white,
                        enableBorder: AppColors.white,
                        hintText: price ?? "50",
                        hintSize: 14,
                        hintweight: FontWeight.w600,
                        controller: controller ?? TextEditingController(),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

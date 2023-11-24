import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      this.isSelected = false,
      this.onChanged,
      this.validator,
      this.color});
  TextEditingController? controller;
  bool readOnly;
  bool isSelected;
  String? text;
  String? price;
  Color? color;
  String? Function(String?)? validator;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                        text: price ?? "0.0",
                        fontSize: 14,
                        weight: FontWeight.w600)
                    : CommonTextField(
                        txtweight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        readOnly: !isSelected,
                        // validator: validator,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'(^\d*\.?\d*)'),
                              replacementString: '1'),
                          // FilteringTextInputFormatter.allow(
                          //     RegExp('^[1-9][0-9]*.[0-9]'),
                          //     replacementString: '1'),
                          LengthLimitingTextInputFormatter(6),
                        ],
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

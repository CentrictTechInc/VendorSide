import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class CommonMobileTextFeild extends StatelessWidget {
  const CommonMobileTextFeild(
      {super.key,
      required this.controller,
      this.validator,
      this.borderColor = AppColors.grey,
      this.countryCodeColor = AppColors.primaryText,
      this.cursorColor = AppColors.grey,
      this.iconColor = AppColors.grey,
      this.lineColor = AppColors.grey,
      this.hintColor = AppColors.grey});
  final Color borderColor;
  final Color countryCodeColor;
  final Color cursorColor;
  final Color hintColor;
  final Color iconColor;
  final Color lineColor;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
            bottom: BorderSide(width: .5, color: borderColor)),
      ),
      child: Row(
        children: [
          Image.asset(
            Drawables.usFlag,
            fit: BoxFit.scaleDown,
            height: 30,
          ),
          CommonText(
            text: "+1",
            fontSize: 18,
            color: countryCodeColor,
          ),
          Container(
            height: 35,
            width: 8,
            decoration: BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(width: 1, color: lineColor),
              ),
            ),
            // child: ,
          ),
          Expanded(
            child: CommonTextField(
              inputType: TextInputType.phone,
              controller: controller,
              validator: validator,
              textColor: AppColors.primaryText,
              hintText: '(000) 000 000',
              cursorColor: cursorColor,
              hintColor: hintColor,
            ),
          ),
        ],
      ),
    );
  }
}

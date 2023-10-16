import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendor_app/common/resources/colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.controller,
    this.isFilledColor = false,
    this.hintText = '',
    this.suffixPadding = 7.5,
    this.prefixPadding = 7.5,
    this.containersize = 60,
    this.txtweight = FontWeight.w400,
    this.hintweight = FontWeight.w400,
    this.hintSize = 15.0,
    this.fontsize = 15.0,
    this.hintColor = AppColors.grey,
    this.borderColor = AppColors.grey,
    this.readOnly = false,
    this.iconColor,
    this.fontFamily = 'Sora',
    this.minLines = 1,
    this.maxLines = 1,
    this.textOnTap,
    this.onChanged,
    this.validator,
    this.changeicon = false,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.inputType = TextInputType.text,
    this.suffix,
    this.pass = false,
    this.enableBorder = AppColors.grey,
    this.disableBorder = AppColors.grey,
    this.textColor = AppColors.secondary,
    this.cursorColor = AppColors.secondary,
    this.padding = const EdgeInsets.all(0.0),
    this.textAlign = TextAlign.start,
    this.contentPadding =
        const EdgeInsets.only(right: 15.0, top: 18, bottom: 14, left: 20),
    this.prefix,
    this.inputFormatters,
  }) : super(key: key);
  final double suffixPadding;
  final double prefixPadding;
  final TextEditingController controller;
  final String hintText;
  final String fontFamily;
  final double fontsize;
  final double containersize;
  final FontWeight txtweight;
  final FontWeight hintweight;
  final double hintSize;
  final Color hintColor;
  final Color borderColor;
  final Color enableBorder;
  final Color disableBorder;
  final Color textColor;
  final Color cursorColor;
  final Color? iconColor;
  final bool pass;
  final bool readOnly;
  final bool changeicon;
  final bool isFilledColor;
  final Function()? textOnTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final int minLines;
  final int? maxLines;
  final Widget? suffix;
  final Widget? prefix;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final AutovalidateMode? autoValidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        cursorColor: cursorColor,
        keyboardType: inputType,
        obscureText: pass,
        readOnly: readOnly,
        minLines: minLines,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        onTap: textOnTap,
        textAlign: textAlign,
        validator: validator,
        autovalidateMode: autoValidateMode,
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(
            fontFamily: fontFamily,
            fontWeight: txtweight,
            fontSize: fontsize,
            color: textColor),
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: isFilledColor,
          hintText: hintText,
          suffixIcon: suffix,
          prefixIcon: prefix,
          prefixIconConstraints: const BoxConstraints(maxHeight: 26),
          suffixIconConstraints: const BoxConstraints(maxHeight: 26),
          contentPadding: contentPadding,
          hintStyle: TextStyle(
              color: hintColor.withOpacity(0.7),
              fontFamily: fontFamily,
              fontSize: hintSize,
              fontWeight: hintweight),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: .5)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: .5)),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: disableBorder, width: .5)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: enableBorder, width: .5)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.25)),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}

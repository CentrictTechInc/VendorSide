import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/common/resources/colors.dart';

class CommonText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color? color;
  final TextOverflow textOverflow;
  final FontWeight weight;
  final double? fontSize;
  final TextAlign textAlign;
  final double lineHeight;
  final double letterSpacing;
  final int? maxLines;
  final TextDecoration? decoration;
  const CommonText({
    Key? key,
    required this.text,
    this.maxLines,
    this.color,
    this.textOverflow = TextOverflow.visible,
    this.fontFamily = 'Sora',
    this.weight = FontWeight.w400,
    this.fontSize,
    this.textAlign = TextAlign.left,
    this.letterSpacing = 1.0,
    this.lineHeight = 1.2,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      softWrap: true,
      style: TextStyle(
        color: color ?? AppColors.primaryText,
        fontFamily: fontFamily,
        fontWeight: weight,
        fontSize: fontSize ?? 20.sp,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? AppColors.primaryText,
        height: lineHeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

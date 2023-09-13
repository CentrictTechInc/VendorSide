import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class NetWorkImageWithInitials extends StatelessWidget {
  const NetWorkImageWithInitials(
      {super.key,
      required this.imageUrl,
      this.name = '',
      this.cacheHeight = 150,
      this.fit = BoxFit.cover,
      this.backgroundColor,
      this.fontSize = 24,
      this.radius = 50,
      this.textColor = AppColors.white});
  final String imageUrl;
  final String? name;
  final BoxFit? fit;
  final Color? backgroundColor;
  final Color? textColor;
  final int cacheHeight;
  final double? fontSize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit,
      cacheHeight: cacheHeight,
      errorBuilder: (context, error, stackTrace) {
        if (name!.isNotEmpty) {
          return Container(
            height: cacheHeight.toDouble(),
            width: cacheHeight.toDouble(),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.secondary,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: CommonText(
                fontSize: fontSize!,
                color: textColor,
                text: name![0].toUpperCase()),
          );
        } else {
          return Image.asset(
            Drawables.logo,
            fit: fit,
          );
        }
      },
    );
  }
}

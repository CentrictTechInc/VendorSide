import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/app/utils/skeleton_loader.dart';
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
      this.imageData,
      this.radius = 50,
      this.fromMemory = false,
      this.textColor = const Color.fromARGB(255, 10, 10, 10)});
  final String imageUrl;
  final String? name;
  final BoxFit? fit;
  final Color? backgroundColor;
  final Color? textColor;
  final int cacheHeight;
  final bool fromMemory;
  final double? fontSize;
  final double radius;
  final String? imageData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: decodeBase64ToImage(imageData ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Image.memory(
              snapshot.data!,
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
          } else {
            return const SkeletonLoader();
          }
        });
  }

  Future<Uint8List> decodeBase64ToImage(String base64String) async {
    return await Future.delayed(const Duration(milliseconds: 400), () {
      // Simulating a delayed decoding process
      return base64.decode(base64String);
    });
  }
}

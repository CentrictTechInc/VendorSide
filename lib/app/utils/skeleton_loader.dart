import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/common/resources/colors.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({this.size = 40, super.key});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.white, boxShadow: []),
      width: context.width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade400,
        child: Container(
          height: size,
          width: size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

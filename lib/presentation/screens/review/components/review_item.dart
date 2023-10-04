import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:sizer/sizer.dart';

class ReviewChild extends StatelessWidget {
  const ReviewChild({
    super.key,
    required this.name,
    required this.rating,
    required this.time,
    required this.description,
    required this.serviceName,
  });

  final String name;
  final String rating;
  final String time;
  final String description;
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey.withOpacity(0.5),
                  width: 0.25,
                ),
                borderRadius: BorderRadius.circular(70)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: const NetWorkImageWithInitials(
                imageUrl: Drawables.personUrl,
                name: "Shaheer",
                backgroundColor: AppColors.green,
              ),
            ),
          ),
          HorizontalSpacing(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: name,
                fontSize: 16,
                weight: FontWeight.w600,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.yellow,
                  ),
                  CommonText(
                    text: rating,
                    fontSize: 14,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          CommonText(
            text: time,
            fontSize: 12,
            color: AppColors.primary,
          )
        ],
      ),
      const VerticalSpacing(20),
      CommonText(color: AppColors.grey, fontSize: 14, text: description),
      const VerticalSpacing(20),
      const CommonText(
        text: "Service",
        fontSize: 14,
        weight: FontWeight.w600,
      ),
      const VerticalSpacing(15),
      Row(
        children: [
          const ImageIcon(
            AssetImage(RGIcons.building),
            size: 25,
          ),
          const HorizontalSpacing(20),
          Expanded(
            child: CommonText(
              text: serviceName,
              fontSize: 12,
            ),
          ),
        ],
      ),
      const VerticalSpacing(20),
      Divider(
        height: 1,
        thickness: 2,
        indent: 2.w,
        endIndent: 2.w,
      ),
      const VerticalSpacing(40),
    ]);
  }
}

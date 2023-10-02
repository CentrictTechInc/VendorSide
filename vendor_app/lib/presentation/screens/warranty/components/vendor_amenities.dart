import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/upload_file.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class VendorAmenities extends StatelessWidget {
  const VendorAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            ImageIcon(AssetImage(RGIcons.workspacePremium)),
            const HorizontalSpacing(10),
            CommonText(
              text: "Automotive Certification and Training",
              fontSize: 14,
              weight: FontWeight.w600,
            ),
          ],
        ),
        const VerticalSpacing(5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.bottomLeft,
          child: CommonText(
            text: "(Check all that apply)",
            fontSize: 10,
            color: AppColors.grey,
          ),
        ),
        const VerticalSpacing(15),
        Align(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            onTap: () {},
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 75,
                width: 80,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    const ImageIcon(
                      AssetImage(RGIcons.upload),
                      color: AppColors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonText(
                      text: "Upload",
                      color: AppColors.white,
                      fontSize: 12,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageIcon(AssetImage(RGIcons.hub)),
            const HorizontalSpacing(10),
            CommonText(
              text: "Amenities",
              fontSize: 14,
              weight: FontWeight.w600,
            ),
            const HorizontalSpacing(10),
            CommonText(
              text: "(Check all that apply)",
              fontSize: 10,
              color: AppColors.grey,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  // controller.warrantyInfo.toggle();
                },
                splashRadius: 10,
                icon: Icon(
                  true ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                  color: AppColors.grey,
                ))
          ],
        )
      ],
    );
  }
}

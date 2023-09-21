import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class PastTasksCard extends StatelessWidget {
  PastTasksCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(color: AppColors.grey.withOpacity(0.2), blurRadius: 2.0),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    const ImageIcon(
                      AssetImage(RGIcons.serviceBuild),
                      size: 20,
                    ),
                    const HorizontalSpacing(8),
                    Expanded(
                      child: CommonText(
                        text: "Services",
                        fontSize: 12,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const VerticalSpacing(10),
                CommonText(
                  text: "Service Name Here",
                  fontSize: 16,
                  weight: FontWeight.w600,
                ),
                const VerticalSpacing(15),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage(RGIcons.calendarDay),
                      color: AppColors.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 5),
                    CommonText(
                      text: "May 20, 2023",
                      fontSize: 10.sp,
                      letterSpacing: 0.7,
                      color: AppColors.grey,
                    )
                  ],
                ),
                const VerticalSpacing(10),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage(RGIcons.sellIcon),
                      color: AppColors.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 5),
                    CommonText(
                      text: "Total invoiced \$50.00",
                      fontSize: 10.sp,
                      letterSpacing: 0.7,
                      color: AppColors.grey,
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 70,
                  height: 70,
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
                      name: "a",
                      backgroundColor: AppColors.whiteGreyish,
                      textColor: AppColors.black,
                      fontSize: 36,
                    ),
                  ),
                ),
                // const HorizontalSpacing(30),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CommonText(
                    text: 'Nista Mark',
                    fontSize: 11.sp,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

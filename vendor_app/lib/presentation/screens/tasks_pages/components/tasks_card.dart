import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';

class TasksCard extends StatelessWidget {
  TasksCard({
    super.key,
    required this.type,
    required this.data,
    required this.icon,
    this.isPending = false,
  });
  final String type;
  final IconData icon;
  bool isPending;
  final TasksModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
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
                if (isPending)
                  Container(
                    width: 97,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.primary),
                    child: Center(
                      child: CommonText(
                        text: "Pending",
                        fontSize: 10,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                const VerticalSpacing(10),
                Row(
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
                    const HorizontalSpacing(10),
                    CommonText(
                      text: 'Nista Mark',
                      fontSize: 12.sp,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                const VerticalSpacing(10),
                const Row(
                  children: [
                    const ImageIcon(
                      AssetImage(RGIcons.serviceBuild),
                      size: 22,
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
                CommonText(
                  text: "Service Name Here",
                  fontSize: 16,
                  weight: FontWeight.w600,
                ),
                const VerticalSpacing(15),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage(RGIcons.location1),
                      color: AppColors.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 5),
                    CommonText(
                      text: "New York",
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 48,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.primary),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonText(
                          text: "Wed",
                          fontSize: 12,
                          color: AppColors.white,
                          weight: FontWeight.w500,
                        ),
                        CommonText(
                          text: "20",
                          fontSize: 18,
                          color: AppColors.white,
                          weight: FontWeight.w600,
                        ),
                      ]),
                ),
                const VerticalSpacing(10),
                CommonText(
                  text: " 6:00 \n   PM",
                  fontSize: 16,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

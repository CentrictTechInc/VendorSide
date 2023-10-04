import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/presentation/screens/notification/components/approved_screen.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    this.completed = false,
  });
  final bool completed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(color: AppColors.grey.withOpacity(0.2), blurRadius: 2.0),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(10),
          Row(
            children: [
              completed
                  ? ImageIcon(
                      const AssetImage(RGIcons.circleCheck),
                      color: AppColors.primary,
                      size: 20.sp,
                    )
                  : ImageIcon(
                      const AssetImage(RGIcons.cancel),
                      color: AppColors.red,
                      size: 20.sp,
                    ),
              const HorizontalSpacing(10),
              completed
                  ? CommonText(
                      text: "Congratulations!",
                      color: AppColors.primaryText,
                      weight: FontWeight.bold,
                      fontSize: 12.sp,
                    )
                  : CommonText(
                      text: "Cancelled",
                      color: AppColors.primaryText,
                      weight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
              const Spacer(),
              CommonText(
                text: "1min ago",
                fontSize: 10.sp,
                color: AppColors.grey,
              ),
              const HorizontalSpacing(5),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 5),
            child: RichText(
              text: TextSpan(
                  text: "Your Quote #1000   ",
                  style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  children: [
                    completed
                        ? TextSpan(
                            text: 'View more...',
                            style: const TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 15,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RequestAcceptedScreen()),
                                );
                              },
                          )
                        : const TextSpan(
                            text: "has been cancelled",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.grey,
                            ),
                          )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vendor_app/app/extensions/buildcontext_extension.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/notification/components/notification_card.dart';
import 'package:sizer/sizer.dart';

class NoficationScreenMobile extends StatelessWidget {
  // final RemoteMessage? message; // to display notification on screen

  const NoficationScreenMobile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: context.width, maxHeight: context.height),
      child: Column(
        children: [
          CommonText(
            //comments are left due to testing
            // text: message?.sentTime.toString() ?? "time",
            text: "formatTime",
            fontSize: 10.sp,
            color: AppColors.grey,
          ),
          CommonText(
            //comments are left due to testing
            // text: message?.notification?.title.toString() ?? "title",
            fontSize: 12.sp,
            text: "",
            color: AppColors.grey,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.greyish),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 0)),
                    itemCount: 14,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const NotificationCard(
                        completed: true,
                      );
                    }),
              ),
            ),
          ),
          const VerticalSpacing(80),
        ],
      ),
    );
  }
}

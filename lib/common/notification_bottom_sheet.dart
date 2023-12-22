import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/dashboard/controller/botton_nav_controller.dart';
import 'package:vendor_app/presentation/screens/dashboard/main_dashboard.dart';
import 'package:vendor_app/presentation/screens/task_biidding/task_bidding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationBottomSheet {
  final controller = Get.find<BottomNavController>();
  showNotification(
    String appiontmentId,
  ) {
    return showModalBottomSheet(
      context: globalScaffoldKey.currentContext!,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: AppColors.grey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context) {
        return TaskBiddingScreen(
          appiontmentId: appiontmentId,
        );
      },
    );
  }
}

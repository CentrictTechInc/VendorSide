import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/bottom_nav/controller/botton_nav_controller.dart';

class HomeBottomNavBar extends StatelessWidget {
  HomeBottomNavBar({super.key});

  final confuse = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      shadow: BoxShadow(
          offset: const Offset(0, -2.5),
          blurRadius: 10.0,
          color: AppColors.black.withOpacity(0.3),
          spreadRadius: 5.0),
      splashRadius: 0,
      activeIndex: 1,
      gapLocation: GapLocation.center,
      height: 70,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 12,
      rightCornerRadius: 12,
      onTap: (index) {
        confuse.changeTabIndex(index);
      },
      itemCount: confuse.iconList.length,
      tabBuilder: (int index, bool isActive) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return ImageIcon(
                  AssetImage(confuse.iconList[index]),
                  size: 25,
                  color: confuse.tabIndex.value == index
                      ? AppColors.secondary
                      : AppColors.grey,
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

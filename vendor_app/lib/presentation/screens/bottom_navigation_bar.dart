import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';

class HomeBottomNavBar extends StatelessWidget {
  HomeBottomNavBar({super.key});

  final iconList = [
    RGIcons.home,
    RGIcons.suitcase,
    RGIcons.messages,
    RGIcons.bell,
  ];

  void onTap(int value, BuildContext context) {
    switch (value) {
      case 0:
        context.go(PagePath.homeScreen);
        break;
      case 1:
        context.go(PagePath.appointment);
        break;
      case 2:
        context.go(PagePath.messages);
        break;
      default:
        context.go(PagePath.notification);
    }
  }

  final bool isNavBarActive = true;
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
        onTap(index, context);
      },
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(iconList[index]),
                size: 25,
                color: index == 0 ? AppColors.secondary : AppColors.grey,
              ),
            ],
          ),
        );
      },
    );
  }
}

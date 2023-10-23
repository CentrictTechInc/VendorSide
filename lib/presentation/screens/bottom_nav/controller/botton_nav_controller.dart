import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class BottomNavController extends GetxController {
  final tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
  }

  PageController pageController = PageController(initialPage: 0);
  final iconList = [
    RGIcons.home,
    RGIcons.suitcase,
    RGIcons.messages,
    RGIcons.bell,
  ];
  final titleList = [
    'Home',
    'Orders',
    'Messages',
    'Notifications',
  ];
}

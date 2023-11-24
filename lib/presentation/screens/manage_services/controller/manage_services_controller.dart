import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageServicesController extends GetxController {
  int tabIndex = 0;
  changeIndex(i) {
    tabIndex = i;
    pageController.jumpToPage(i);
    update();
  }

  TextEditingController chargeController = TextEditingController();
  double vendorCharge = 0.0;

  final PageController pageController = PageController(
    initialPage: 0,
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksController extends GetxController {
  int tabIndex = 0;
  changeIndex(i) {
    tabIndex = i;
    pageController.jumpToPage(i);
    update();
  }

  final PageController pageController = PageController(
    initialPage: 0,
  );
}

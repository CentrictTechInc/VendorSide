import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/data/dto/tasks_dto.dart';
import 'package:vendor_app/data/repository/tasks_repository.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/domain/repository/tasks_repository.dart';

class BottomNavController extends GetxController {
  TasksRepository repo = TasksRepositoryImpl();
  TasksStatusResponseModel? tasks;

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

  Future getAutoAppointments(String id) async {
    try {
      tasks = await repo.getAppointmentbyId(id: id);
      // print(tasks?.toJson());
      // return response;
    } catch (e) {
      rethrow;
    }
  }
}

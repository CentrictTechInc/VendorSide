import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/repository/tasks_repository.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/domain/repository/tasks_repository.dart';

class TasksController extends GetxController {
  TasksRepository repo = TasksRepositoryImpl();
  int tabIndex = 0;
  List<TasksStatusResponseModel> tasksList = [];
  changeIndex(i) {
    tabIndex = i;
    pageController.jumpToPage(i);
    update();
  }

  final PageController pageController = PageController(
    initialPage: 0,
  );

  Future getTasks({String? status}) async {
    try {
      final response = await repo.getTasks(status: status);
      tasksList = response;
    } catch (e) {
      ToastMessage.message(e.toString());
      rethrow;
    }
  }
}

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
  List<TasksStatusResponseModel> pendindTasksList = [];
  List<TasksStatusResponseModel> pastTasksList = [];
  changeIndex(i) {
    tabIndex = i;
    pageController.jumpToPage(i);
    update();
  }

  final PageController pageController = PageController(
    initialPage: 0,
  );

  Future getAutoTasks({String? status}) async {
    if (tasksList.isNotEmpty) {
      tasksList.clear();
    }
    try {
      final response = await repo.getAutoTasks(status: status);
      if (status == 'pending') {
        {
          tasksList = response;
          return;
        }
      } else if (status == 'past') {
        pastTasksList = response;
        return;
      }
    } catch (e) {
      ToastMessage.message(e.toString());
      rethrow;
    }
  }

  Future getAutoPendingTasks() async {
    try {
      final response = await repo.pendingAutoTask();
      pendindTasksList = response;
    } catch (e) {
      ToastMessage.message(e.toString());
      rethrow;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/tasks_bidding_dto.dart';
import 'package:vendor_app/data/repository/tasks_repository.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/domain/repository/tasks_repository.dart';

class BottomNavController extends GetxController {
  TasksRepository repo = TasksRepositoryImpl();
  TasksStatusResponseModel? tasks;

  TextEditingController priceController = TextEditingController(text: '100');

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

  Future postBidding(String appointmentId) async {
    try {
      TasksBiddingDto data = TasksBiddingDto(
        appointmentId: int.tryParse(appointmentId),
        priceRate: double.tryParse(priceController.text),
        serviceId: tasks?.serviceId,
        serviceTypeId: LocalStorageService.instance.user?.vendorType,
        serviceName: tasks?.serviceName,
        subServiceId: tasks?.subServiceId,
        subServiceName: tasks?.subServiceName,
        vendorId: LocalStorageService.instance.user?.vid,
      );
      String res = await repo.postBidding(data);
      print(res);

      ToastMessage.message(
          "Your bid has been submitted for appointment ID $appointmentId.",
          type: ToastType.success);
    } catch (e) {
      rethrow;
    }
  }
}

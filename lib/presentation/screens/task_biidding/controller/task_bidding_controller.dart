import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/tasks_bidding_dto.dart';
import 'package:vendor_app/data/repository/tasks_repository.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/domain/repository/tasks_repository.dart';

class TaskBiddingController extends GetxController {
  final String appointmentId;

  TaskBiddingController(this.appointmentId);
  TasksRepository repo = TasksRepositoryImpl();
  TasksStatusResponseModel? tasks;
  TextEditingController priceController = TextEditingController();

  @override
  Future<void> onReady() async {
    super.onReady();
    await getAutoAppointments(appointmentId);
  }

  Future getAutoAppointments(String id) async {
    try {
      tasks = await repo.getAppointmentbyId(id: id);
      update();
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
      debugPrint(res);
      update();
      globalContext?.pop();
      int id = int.tryParse(appointmentId) ?? 0;
      ToastMessage.message(
          "Your bid has been submitted for appointment ID: ${id + 9098}.",
          type: ToastType.success);
    } catch (e) {
      rethrow;
    }
  }
}

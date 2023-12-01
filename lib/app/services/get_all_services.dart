import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/data/repository/services_repository.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/service_repository.dart';

class GetAllServices extends GetxService {
  ServiceRepository repo = ServiceRepositoryImpl();
  List<ServicesModel> autoMotiveServiceList = [];
  List<ServicesModel> homeImprovementServiceList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllServices();
  }

  getHIServices() {
    return homeImprovementServiceList;
  }

  getAotuServices() {
    return autoMotiveServiceList;
  }

  Future getAllServices() async {
    if (autoMotiveServiceList.isNotEmpty) {
      return;
    }
    try {
      final services = await repo.getAllServices();

      for (var entry in services) {
        addService(entry);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void addService(ServicesModel entry) {
    if (entry.serviceTypeId == 1) {
      if (autoMotiveServiceList
          .where((element) => entry.serviceId == element.serviceId)
          .toList()
          .isEmpty) {
        autoMotiveServiceList.add(entry);
      } else {
        autoMotiveServiceList
            .where((element) => entry.serviceId == element.serviceId)
            .firstOrNull
            ?.listSubServiceName
            .add(entry.listSubServiceName.first);
      }
    } else if (entry.serviceTypeId == 2) {
      homeImprovementServiceList.add(entry);
    }
  }
}

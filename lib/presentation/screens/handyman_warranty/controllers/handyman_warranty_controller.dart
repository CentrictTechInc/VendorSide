import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/h_service_warranty_dto.dart';
import 'package:vendor_app/data/repository/services_amenities_repository.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/services_amenities_repository.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';

class HandymanWarrantyController extends GetxController {
  ServicesAmenitiesRepository repo = ServicesAmenitiesRepositoryImpl();
  final cntrl = Get.find<ServiceController>();
  TextEditingController areaController = TextEditingController();
  final radioButton = 0.obs;
  String selectedValue = "0";
  TextEditingController chargeController = TextEditingController();
  double vendorCharge = 0.0;
  var serviceNames = [];
  List<ServicesModel> serviceList = [];
  String selectedServiceName = "";
  int selectedServiceId = 0;

  @override
  void onReady() async {
    super.onReady();
    await cntrl.getAllServices();
    getServiceName();
  }

  Future getServiceName() async {
    serviceList = cntrl.homeImprovementServiceList;
    for (var i = 0; i < serviceList.length; i++) {
      if (!serviceNames.contains(serviceList[i].serviceName)) {
        serviceNames.add(serviceList[i].serviceName);
        // selectedServiceId.where((element) => element == serviceList[i].serviceId);
      }
    }
    update();
  }

  void getSelectedServiceId() {
    for (var service in serviceList) {
      if (service.serviceName == selectedServiceName) {
        selectedServiceId = service.serviceId;
        break;
      }
    }
  }

  Future postHIService() async {
    try {
      getSelectedServiceId();
      final res = await repo.homeServicePriceUpdate(HomeImprovementServiceDto(
        vendorId: LocalStorageService.instance.user?.vid,
        serviceName: selectedServiceName,
        serviceCharges: double.parse(chargeController.text),
        vendorLocation: areaController.text,
        serviceId: selectedServiceId,
        serviceTypeId: 0,
        vendorServiceId: 0,
      ));
      Get.snackbar("Success", res);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}

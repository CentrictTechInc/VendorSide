import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/repository/services_repository.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/service_repository.dart';

class AutomotiveWarrantyController extends GetxController {
  final radioButton = 0.obs;
  PlatformFile? platformFile;
  List<PlatformFile>? listplatformFile;
  List<File>? files;
  String selectedValue = "0";
  int steps = 1;
  List<bool> isChecked = List<bool>.filled(30, false);
  // List<bool> isChecked = [];
  List<String> amenitiesList = [
    "Early drop off",
    "Loaner car",
    "Free wifi",
    "State inspection",
    "Wait on site",
    "Availability Today",
    "Shuttle service",
    "State inspection",
    "Autobody Services",
    "Complimentary Refreshments",
    "Contactless Payment",
    "Detailing",
    "Digital Inspection",
    "Financing Available",
    "Fleet Services",
    "Kid Friendly Waiting Area",
    "Loaner Car",
    "Loyalty / Rewards Program",
    "Restrooms",
    "Roadside Assistance",
    "Shuttle Service",
    "State Inspection",
    "Towing",
    "TV",
    "Waiting Room",
    "WiFi",
  ];
}

class ServiceController extends GetxController {
  var autoMotiveServiceList = <ServicesModel>[].obs;
  var homeImprovementServiceList = <ServicesModel>[].obs;

  ServiceRepository repo = ServiceRepositoryImpl();

  Future getAllServices() async {
    if (autoMotiveServiceList.isNotEmpty) {
      return;
    }
    try {
      ShowDialogBox.showDialogBoxs(true);
      final services = await repo.getAllServices();
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }

      for (var entry in services) {
        addService(entry);
      }
      update();
    } catch (e) {
      ToastMessage.message(e.toString());
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

  // getVendorCharge(String serviceCharge, double vendorCharge) {
  //   if (serviceCharge != '') {
  //     vendorCharge = double.tryParse(serviceCharge) ?? 0.0;
  //   }
  //   vendorCharge = (vendorCharge * 0.85).toPrecision(2);
  //   update();
  //   print(vendorCharge.obs);
  // }
}

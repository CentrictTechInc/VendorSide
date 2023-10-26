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
  String selectedValue = "12 Months / 12,000 Miles";
  int steps = 1;
  List<bool> isChecked = List<bool>.filled(30, false);
  List<String> amenitiesCheckedList = [];

  List<String> warrantyDuration = [
    "12 Months / 12,000 Miles",
    "24 Months / 24,000 Miles",
    "36 Months / 36,000 Miles",
  ];
  List<String> amenitiesList = [
    "Early drop off",
    "Loaner car",
    "Free wifi",
    "Availability Today",
    "Shuttle service",
    "Autobody Services",
    "Complimentary Refreshments",
    "Contactless Payment",
    "Detailing",
    "Digital Inspection",
    "Financing Available",
    "Fleet Services",
    "Kid Friendly Waiting Area",
    "Loyalty / Rewards Program",
    "Restrooms",
    "Roadside Assistance",
    "Shuttle Service",
    "State Inspection",
    "Towing",
    "TV",
    "Waiting Room",
  ];

  Future postWarrantyAndAmenitiesInfo() async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      print("warranty Duration: $selectedValue");
      print("Amenities: $amenitiesCheckedList");
      print("Image Files: ${files}");
      await Future.delayed(const Duration(seconds: 1));
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      ToastMessage.message("Information Added Succesfully!",
          type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

class ServiceController extends GetxController {
  var autoMotiveServiceList = <ServicesModel>[].obs;
  var homeImprovementServiceList = <ServicesModel>[].obs;
  double animatedHeight = 130;
  List<String> alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

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
}

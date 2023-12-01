import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/dto/training_amenities_dto.dart';
import 'package:vendor_app/data/repository/services_amenities_repository.dart';
import 'package:vendor_app/data/repository/services_repository.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/service_repository.dart';
import 'package:vendor_app/domain/repository/services_amenities_repository.dart';

class AutomotiveWarrantyController extends GetxController {
  ServicesAmenitiesRepository repo = ServicesAmenitiesRepositoryImpl();

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
      TrainingAmenitiesDto data = TrainingAmenitiesDto(
          certificateName:
              "Automotive Warranty of, ${LocalStorageService.instance.user?.firstName ?? ''}",
          vid: LocalStorageService.instance.user!.vid!,
          serviceWarranty: selectedValue,
          amenities: amenitiesCheckedList);

      final res = await repo.uploadTrainingAmenitiesForm(data, files!);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
    }
  }
}

class ServiceController extends GetxController {
  final ServicesAmenitiesRepository _repo = ServicesAmenitiesRepositoryImpl();
  List<ServicesModel> autoMotiveServiceList = [];
  List<ServicesModel> homeImprovementServiceList = [];
  double animatedHeight = 130;
  List<ServicePrice> servicePriceList = [];
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
  Future postServicePackagePricing() async {
    try {
      if (servicePriceList.isEmpty) {
        ToastMessage.message("Please Select At Least One Service",
            type: ToastType.info);
        return;
      } else {
        for (var element in servicePriceList) {
          if (element.serviceCharges == 0) {
            ToastMessage.message("Please Enter Service Charges Of All Services",
                type: ToastType.warn);
            return;
          }
        }
      }
      ShowDialogBox.showDialogBoxs(true);

      final res = await _repo.servicePackagePricing(servicePriceList);
      await Future.delayed(const Duration(seconds: 1));
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      ToastMessage.message("$res!", type: ToastType.success);
      globalContext?.go(PagePath.reviewInProcess);
    } catch (e) {
      ToastMessage.message(e.toString());
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
    }
  }

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
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
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

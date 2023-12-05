import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/get_all_services.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/a_services_dto.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/repository/a_services_repository.dart';
import 'package:vendor_app/data/repository/services_amenities_repository.dart';
import 'package:vendor_app/domain/entity/a_services_model.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/a_services_reposotory.dart';
import 'package:vendor_app/domain/repository/services_amenities_repository.dart';

class ManageAmServicesController extends GetxController {
  AutoServiceRepository repo = AutoServiceRepositoryImp();
  final ServicesAmenitiesRepository priceRepo =
      ServicesAmenitiesRepositoryImpl();

  List<ServicesModel> amList = [];
  //auto motive vendor service abrivation amvs
  List<AutoServicesModel> amvsList = [];
  List<AutoServicesDto> amvsPrice = [];
  List<ServicePrice> servicePriceList = [];

  @override
  void onInit() {
    super.onInit();
    // amList = Get.find<GetAllServices>().autoMotiveServiceList;
    amList = Get.find<GetAllServices>().autoMotiveServiceList.map((service) {
      service.isSelected = false;
      for (var subService in service.listSubServiceName) {
        subService?.isSelected = false;
      }
      return service;
    }).toList();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getVendorAmServices();
    print("object");
  }

  Future getVendorAmServices() async {
    try {
      if (amvsList.isNotEmpty) {
        amvsList.clear();
        // update();
        // return;
      }
      amvsList = await repo.getAutoServices();

      // In this code, Set<int> amvsSubServiceIds = amvsList.map((autoService) => autoService.subServiceId).toSet();
      // creates a Set of subServiceIds from amvsList.
      // !amvsSubServiceIds.contains(subService?.subServiceId) checks if the subServiceId
      //of the current ListSubServiceName is not in amvsSubServiceIds.
      Set<int?> amvsSubServiceIds =
          amvsList.map((autoService) => autoService.subServiceId).toSet();

      amList = amList.map((service) {
        service.listSubServiceName =
            service.listSubServiceName.where((subService) {
          return !amvsSubServiceIds.contains(subService?.subServiceId);
        }).toList();
        return service;
      }).toList();
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future postServicePackagePricing() async {
    try {
      print(servicePriceList);
      if (servicePriceList.isEmpty) {
        ToastMessage.message("Please Select At Least One Service",
            type: ToastType.info);
        return;
      } else {
        for (var element in servicePriceList) {
          if (element.serviceCharges == 0) {
            ToastMessage.message("Please Enter Service Charges Of Services",
                type: ToastType.warn);
            return;
          }
        }
        // return;
      }
      ShowDialogBox.showDialogBoxs(true);
      print(servicePriceList);
      final res = await priceRepo.servicePackagePricing(servicePriceList);

      await Future.delayed(const Duration(seconds: 1));
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      ToastMessage.message("$res", type: ToastType.success);
      onReady();
      update();
      // globalContext?.go(PagePath.reviewInProcess);
    } catch (e) {
      ToastMessage.message(e.toString());
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
    }
  }

  int tabIndex = 0;
  changeIndex(i) {
    tabIndex = i;
    update();
  }

  double vendorCharge = 0.0;
}

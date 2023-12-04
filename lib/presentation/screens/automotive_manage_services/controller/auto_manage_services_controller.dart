import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/services/get_all_services.dart';
import 'package:vendor_app/data/repository/a_services_repository.dart';
import 'package:vendor_app/domain/entity/a_servoces_model.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/a_services_reposotory.dart';

class ManageAmServicesController extends GetxController {
  AutoServiceRepository repo = AutoServiceRepositoryImp();
  List<ServicesModel> amList = [];
  //auto motive vendor list
  List<AutoServicesModel> amVendorServiceList = [];

  @override
  void onInit() {
    super.onInit();
    amList = Get.find<GetAllServices>().autoMotiveServiceList;
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getVendorAmServices();
  }

  Future getVendorAmServices() async {
    try {
      if (amVendorServiceList.isNotEmpty) {
        // amVendorServiceList.clear();
        update();
        return;
      }
      amVendorServiceList = await repo.getAutoServices();
      // print(amVendorServiceList);
      update();
    } catch (e) {
      rethrow;
    }
  }

  int tabIndex = 0;
  changeIndex(i) {
    tabIndex = i;
    update();
  }

  double vendorCharge = 0.0;
}

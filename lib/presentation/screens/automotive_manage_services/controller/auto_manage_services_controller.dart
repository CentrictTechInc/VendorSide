import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/services/get_all_services.dart';
import 'package:vendor_app/domain/entity/services_model.dart';

class ManageAmServicesController extends GetxController {
  final serviceCntrl = Get.find<GetAllServices>();
  List<ServicesModel> amList = [];

  @override
  void onInit() {
    super.onInit();
    amList = serviceCntrl.autoMotiveServiceList;
  }

  int tabIndex = 0;
  changeIndex(i) {
    tabIndex = i;
    pageController.jumpToPage(i);
    update();
  }

  TextEditingController chargeController = TextEditingController();
  double vendorCharge = 0.0;

  final PageController pageController = PageController(
    initialPage: 0,
  );
}

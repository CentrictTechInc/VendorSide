import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/enum.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/h_service_warranty_dto.dart';
import 'package:vendor_app/data/repository/services_amenities_repository.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/services_amenities_repository.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/a_service_controller.dart';

class HandymanWarrantyController extends GetxController {
  ServicesAmenitiesRepository repo = ServicesAmenitiesRepositoryImpl();
  final cntrl = Get.find<ServiceController>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController areaController = TextEditingController();
  final radioButton = 0.obs;
  String selectedValue = "0";
  TextEditingController chargeController = TextEditingController();
  double vendorCharge = 0.0;
  List<String> serviceNames = [];
  List<ServicesModel> serviceList = [];
  String selectedServiceName = "";
  int selectedServiceId = 0;

  @override
  void onReady() async {
    super.onReady();
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
      if (selectedServiceId == 0) {
        ToastMessage.message("Please Select At Least One Service!",
            type: ToastType.info);
        return;
      } else {
        if (chargeController.text.isEmpty) {
          ToastMessage.message("Please Enter Service Charges Of Your Services!",
              type: ToastType.warn);
          return;
        }
      }
      ShowDialogBox.showDialogBoxs(true);

      await repo.postHIServicePricing(HomeImprovementServiceDto(
        vendorId: LocalStorageService.instance.user?.vid,
        serviceName: selectedServiceName,
        serviceCharges: double.parse(chargeController.text),
        vendorLocation: areaController.text,
        serviceId: selectedServiceId,
        serviceTypeId: VendorType.homeImprovementVendor.index,
        vendorServiceId: 0,
      ));
      ToastMessage.message("Your Service Record Has been Saved!",
          type: ToastType.success);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      globalContext?.go(PagePath.login);
    } catch (e) {
      ToastMessage.message(e.toString(), type: ToastType.success);
    }
  }
}

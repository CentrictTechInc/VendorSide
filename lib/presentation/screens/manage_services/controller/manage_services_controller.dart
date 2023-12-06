import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/enum.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/h_service_warranty_dto.dart';
import 'package:vendor_app/data/repository/services_amenities_repository.dart';
import 'package:vendor_app/domain/entity/h_service_warranty_model.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/services_amenities_repository.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';

class ManageServicesController extends GetxController {
  ServicesAmenitiesRepository repo = ServicesAmenitiesRepositoryImpl();
  TextEditingController areaController = TextEditingController();
  TextEditingController chargeController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ServiceController? serviceController;
  List<ServicesModel> serviceList = [];
  String selectedServiceName = "";
  int selectedServiceId = 0;
  List<String> serviceNames = [];
  bool isEdit = false;
  int vendorServiceId = 0;
  HomeImprovementServiceModel data = HomeImprovementServiceModel();

  @override
  void onInit() {
    Get.isRegistered<ServiceController>()
        ? serviceController = Get.find<ServiceController>()
        : serviceController = Get.put(ServiceController());
    super.onInit();
  }

  @override
  void onReady() async {
    await serviceController?.getAllServices();
    await getServiceName();
    await getVendorServicePricing();
    super.onReady();
  }

  Future getVendorServicePricing() async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      HomeImprovementServiceModel data = await repo
          .getHIServicePricing(LocalStorageService.instance.user?.vid ?? 0);
      if (data.serviceId != null) {
        areaController.text = data.vendorLocation ?? "";
        chargeController.text = data.serviceCharges.toString();
        selectedServiceName = data.serviceName ?? "";
        vendorServiceId = data.vendorServiceId ?? 0;
      }
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
    } catch (e) {
      ToastMessage.message(e.toString());
    }
    update();
  }

  Future getServiceName() async {
    serviceList = serviceController?.homeImprovementServiceList ?? [];
    for (var i = 0; i < serviceList.length; i++) {
      if (!serviceNames.contains(serviceList[i].serviceName)) {
        serviceNames.add(serviceList[i].serviceName);
        // selectedServiceId.where((element) => element == serviceList[i].serviceId);
      }
    }
    update();
  }

  Future updateHIService() async {
    isEdit = false;
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

      final res = await repo.putHIServicePricing(HomeImprovementServiceDto(
        vendorId: LocalStorageService.instance.user?.vid,
        serviceName: selectedServiceName,
        serviceCharges: double.parse(chargeController.text),
        vendorLocation: areaController.text,
        serviceId: selectedServiceId,
        serviceTypeId: VendorType.homeImprovementVendor.index,
        vendorServiceId: vendorServiceId,
      ));
      print(res);
      ToastMessage.message("Service Details has been updated!",
          type: ToastType.success);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
    } catch (e) {
      ToastMessage.message(e.toString(), type: ToastType.success);
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

  double vendorCharge = 0.0;

  final PageController pageController = PageController(
    initialPage: 0,
  );
}

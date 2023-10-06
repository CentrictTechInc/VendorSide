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
  final warrantyInfo = false.obs;
  String selectedValue = "0";
  int steps = 1;
  List<bool> isChecked = List<bool>.filled(10, false);
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
      print("me service:");
      print(services);
      for (var entry in services) {
        addService(entry);
      }
      print("me List of service:");

      print(autoMotiveServiceList);
      print(homeImprovementServiceList);
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

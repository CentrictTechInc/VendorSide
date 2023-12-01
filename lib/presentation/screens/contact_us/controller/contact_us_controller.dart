import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/contactus_dto.dart';
import 'package:vendor_app/data/repository/contact_repository.dart';
import 'package:vendor_app/domain/repository/contact_repository.dart';

class ContactUsContoller extends GetxController {
  ContactUsRepository repo = ContactUsRepositoryImpl();
  Future contactUs(String comments) async {
    try {
      final user = LocalStorageService.instance.user;

      ShowDialogBox.showDialogBoxs(true);
      ContactUsDto info = ContactUsDto(
          contactId: user?.vid ?? 1,
          contactName: "${user?.firstName} ${user?.lastName}",
          vendorShopName: user?.jobTitle ?? "job",
          email: user?.vendoremail ?? "email",
          phoneNumber: user?.vendorMobileDetail ?? "",
          comment: comments);
      String res = await repo.contactUs(info);

      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

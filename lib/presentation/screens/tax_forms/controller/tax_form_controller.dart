import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/pli_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/repository/tax_repository.dart';
import 'package:vendor_app/domain/repository/tax_repository.dart';

class TaxFromController extends GetxController {
  // TaxFromDto? taxData;
  String taxImage = '';
  String pliImage = '';
  TaxRepository repo = TaxRepositoryImpl();
  Future<int> uploadTaxForm() async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      TaxFromDto data = TaxFromDto(
          fileName: "EIN(W9 Form)",
          // vendorId: LocalStorageService.instance.user!.vid,
          vendorId: 1,
          taxForm: taxImage);
      final res = await repo.uploadTaxForm(data);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      await ToastMessage.message(res.message, type: ToastType.success);
      return res.certificateid;
    } catch (e) {
      ToastMessage.message(e.toString());
      return 0;
    }
  }

  Future uploadPLIForm({
    int certificateId = 0,
    String fileName = '',
  }) async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      PLIFormDto? pliData = PLIFormDto(
          certificateId: certificateId,
          fileName: fileName,
          // vendorId: LocalStorageService.instance.user!.vid,
          vendorId: 1,
          pliFile: pliImage);
      final res = await repo.uploadPLIForm(pliData);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }

      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

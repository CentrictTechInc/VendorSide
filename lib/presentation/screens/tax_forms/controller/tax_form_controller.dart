import 'dart:io';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/pli_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/repository/tax_repository.dart';
import 'package:vendor_app/domain/repository/tax_repository.dart';

class TaxFromController extends GetxController {
  // TaxFromDto? taxData;
  late File taxImage;
  late File pliImage;
  TaxRepository repo = TaxRepositoryImpl();
  Future<int> uploadTaxForm() async {
    try {
      TaxFromDto data = TaxFromDto(
        fileName: "EIN(W9 Form)",
        vendorId: LocalStorageService.instance.user!.vid!,
      );
      final res = await repo.uploadTaxForm(data, taxImage);
      return res.certificateid;
    } catch (e) {
      ToastMessage.message(e.toString());
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      return 0;
    }
  }

  Future uploadPLIForm({
    int certificateId = 0,
  }) async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      PLIFormDto? pliData = PLIFormDto(
        certificateId: certificateId,
        fileName: "Insurance Form",
        vendorId: LocalStorageService.instance.user!.vid!,
      );
      final res = await repo.uploadPLIForm(pliData, pliImage);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      if (res == "Document uploaded Succesfully!") {
        ToastMessage.message(res, type: ToastType.success);
        globalContext?.push(PagePath.automotiveService);
      }
    } catch (e) {
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
    }
  }
}

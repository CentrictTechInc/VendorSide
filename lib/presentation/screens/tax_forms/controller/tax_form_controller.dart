import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/pli_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/repository/tax_repository.dart';
import 'package:vendor_app/domain/repository/tax_repository.dart';

class TaxFromController extends GetxController {
  // TaxFromDto? taxData;
  TaxRepository repo = TaxRepositoryImpl();
  Future uploadTaxForm(
    TaxFromDto taxData,
  ) async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      final res = await repo.uploadTaxForm(taxData);
      await uploadPLIForm(certificateId: res.certificateid);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }

      ToastMessage.message(res.message, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }

  Future uploadPLIForm({PLIFormDto? pliData, int certificateId = 0}) async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      pliData?.certificateId = certificateId;
      // pliData?. = certificateId;
      final res = await repo.uploadPLIForm(pliData!);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }

      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

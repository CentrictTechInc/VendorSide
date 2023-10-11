import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class TaxFromController extends GetxController {
  TaxFromDto? data;
  AuthRepository repo = AuthRepositoryImpl();
  Future uploadTaxForm(TaxFromDto data) async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      final res = await repo.uploadTaxForm(data);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }

      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

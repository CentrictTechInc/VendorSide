import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class PasswordController extends GetxController {
  final AuthRepository _repo = AuthRepositoryImpl();

  Future forgotPassword(String email) async {
    try {
      {
        final String result = await _repo.forgot(email);
        ToastMessage.message(result, type: ToastType.info);
        if (globalContext!.mounted) {
          globalContext?.push('${PagePath.emailOtp}/$email');
        }
      }
    } catch (e) {
      ToastMessage.message(e.toString(), type: ToastType.error);
    }
  }

  Future<void> changeNewPassword(
      String email, String password, String confirmPassword) async {
    try {
      final String result =
          await _repo.resetNewPassword(email, password, confirmPassword);
      ToastMessage.message(result, type: ToastType.success);
      if (globalContext!.mounted) {
        globalContext?.go(PagePath.login);
      }
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

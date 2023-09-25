import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/entity/user_model.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';
import 'package:vendor_app/presentation/screens/auth/otp/controllers/otp_controller.dart';

class LoginController extends GetxController {
  final passToggle = false.obs;

  final count = 0.obs;
  increment() => count.value++;
  passwordToggle() => passToggle.toggle();
  final AuthRepository _repo = AuthRepositoryImpl();

  Future login(String email, String pass) async {
    try {
      UserModel res = await _repo.login(email, pass);
      LocalStorageService.instance.user = res;
      globalContext?.go(PagePath.homeScreen);
    } catch (e) {
      if (e.toString().toLowerCase().contains('email was not verified')) {
        OtpController().generateOtp(email);
        // generateOtp(email);
        return;
      }
      ToastMessage.message(e.toString());
    }
  }

  // Future generateOtp(String email) async {
  //   try {
  //     {
  //       final String result = await _repo.generateOtp(email);
  //       ToastMessage.message(result, type: ToastType.info);
  //       if (globalContext!.mounted) {
  //         globalContext?.push('${PagePath.registerEmailOtp}/$email');
  //       }
  //     }
  //   } catch (e) {
  //     ToastMessage.message(e.toString(), type: ToastType.error);
  //   }
  // }
}

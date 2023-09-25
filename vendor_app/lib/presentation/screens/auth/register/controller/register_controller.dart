import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/registration_dto.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

enum RequestStatus { LOADING, SUCESS, ERROR }

class RegisterController extends GetxController {
  final AuthRepository _repo = AuthRepositoryImpl();

  Future register(VendorRegistrationDto register) async {
    try {
      String res = await _repo.register(register);
      ToastMessage.message(res, type: ToastType.success);
      globalContext
          ?.push("${PagePath.registerEmailOtp}/${register.vendoremail.text}");
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }

  Future registerEmailOtp(String email, String otp) async {
    try {
      String res = await _repo.registerEmailVerification(email, otp);
      ToastMessage.message(res, type: ToastType.success);
      // globalContext
      //     ?.push("${PagePath.registerEmailOtp}/${register.email.text}");
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

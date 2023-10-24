import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/generate_otp_service.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/entity/user_model.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class LoginController extends GetxController {
  // @override
  // void onReady() {
  //   super.onReady();
  //   if (LocalStorageService.instance.user != null) {
  //     globalContext?.go(PagePath.slash);
  //   }
  // }

  final passToggle = false.obs;
  final AuthRepository _repo = AuthRepositoryImpl();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future login() async {
    try {
      ShowDialogBox.showDialogBoxs(true);

      UserModel res =
          await _repo.login(emailController.text, passController.text);
      LocalStorageService.instance.user = res;

      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      globalContext?.go(PagePath.slash);
    } catch (e) {
      if (e.toString().contains('Email Was Not verified')) {
        GenerateOtpService().generateOtp(_repo, emailController.text);
        globalContext
            ?.push("${PagePath.registerEmailOtp}/${emailController.text}");
        ToastMessage.message(e.toString(), type: ToastType.warn);

        return;
      }
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      ToastMessage.message(e.toString());
    }
  }
}

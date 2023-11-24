import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class PasswordController extends GetxController {
  final AuthRepository _repo = AuthRepositoryImpl();
  final GlobalKey<FormState> passForm = GlobalKey();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final obscure = false.obs;

  Future forgotPassword(String email) async {
    try {
      ShowDialogBox.showDialogBoxs(true);

      final String result = await _repo.forgot(email);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      ToastMessage.message(result, type: ToastType.info);
      if (globalContext!.mounted) {
        globalContext?.push('${PagePath.emailOtp}/$email');
      }
    } catch (e) {
      ToastMessage.message(e.toString(), type: ToastType.error);
    }
  }

  //   'https://ec2-35-154-149-43.ap-south-1.compute.amazonaws.com/api/Account/Both/otpverification?otp=6357&email=bapak12711%40dixiser.com&type=Vendor
  // Forgot Email OTP API Function
  Future<void> forgotEmailOtpVerification(String email, String otp) async {
    try {
      final String result = await _repo.forgotEmailOtpVerification(email, otp);
      if (result != 'Otp Not Matched!') {
        if (globalContext!.mounted) {
          ToastMessage.message(result, type: ToastType.success);
          globalContext?.replace('${PagePath.createNewPassword}/$email');
        }
      } else {
        ToastMessage.message(result);
      }
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }

  Future<void> changeNewPassword(String email) async {
    try {
      final String result = await _repo.resetNewPassword(
          email, newPassController.text, confirmPassController.text);
      ToastMessage.message(result, type: ToastType.success);
      if (globalContext!.mounted) {
        globalContext?.go(PagePath.login);
      }
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

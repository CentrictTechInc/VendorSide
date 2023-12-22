import 'dart:async';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class OtpController extends GetxController {
  final AuthRepository _repo = AuthRepositoryImpl();
  int secondsRemaining = 30;
  Timer? timer;
  bool enableResend = false;
  void resendCode(String email) {
    secondsRemaining = 30;
    enableResend = false;
    generateOtp(email);
    update();
  }

  @override
  void onReady() {
    super.onReady();
    initializeTimer();
  }

  void initializeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        update();
      } else {
        enableResend = true;
        update();
      }
    });
  }

  Future generateOtp(String email) async {
    try {
      {
        final String result = await _repo.generateOtp(email);
        ToastMessage.message(result, type: ToastType.info);
      }
    } catch (e) {
      ToastMessage.message(e.toString(), type: ToastType.error);
    }
  }

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
}

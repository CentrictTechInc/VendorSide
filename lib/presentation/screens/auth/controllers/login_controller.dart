import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/generate_otp_service.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/services/notification_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/entity/user_model.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';
import 'package:vendor_app/presentation/screens/chat/controllers/fb_msg_service.dart';

class LoginController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    if (LocalStorageService.instance.user != null) {
      globalContext?.go(PagePath.slash);
    }
  }

  final passToggle = false.obs;
  final AuthRepository _repo = AuthRepositoryImpl();
  final TextEditingController emailController =
      TextEditingController(text: "sedefi1737@hupoi.com");
  //second email
  //wokepej604@dpsols.com
  //test email
  // sedefi1737@hupoi.com
  //  "tedimib710@scubalm.com"

  final TextEditingController passController =
      TextEditingController(text: "Test@123");
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  redirectStepper(int step) {
    switch (step) {
      case 0:
        globalContext?.go(PagePath.slash);
      case 1:
        globalContext?.go(PagePath.category);
        break;
      case 2:
        globalContext?.go(PagePath.taxForm);
        break;
      case 3:
        globalContext?.go(PagePath.automotiveService);
        break;
      case 4:
        globalContext?.go(PagePath.reviewInProcess);
        break;
    }
  }

  Future login() async {
    try {
      String formattedDate =
          DateFormat('yyyy-MM-dd – kk:mm:ss').format(DateTime.now());
      ShowDialogBox.showDialogBoxs(true);

      UserModel res =
          await _repo.login(emailController.text, passController.text);
      LocalStorageService.instance.user = res;
      await FirebaseMessagingService.instance.addUserToFirebase();

      if (res.step == 0) {
        await NotificationService.intance.sendNotification(
          "Repair Guru - Login Alert",
          "Dear ${res.firstName ?? "Vendor"}, you have successfully logged into RG Vendor App at  $formattedDate",
          LocalStorageService.instance.fcmToken ?? "",
        );
      } else {
        await NotificationService.intance.sendNotification(
          "Repair Guru - Login Alert",
          "Dear ${res.firstName ?? "Vendor"}, your registration is still pending. Please complete your registration.",
          LocalStorageService.instance.fcmToken ?? "",
        );
      }

      redirectStepper(res.step ?? 4);
    } catch (e) {
      if (e.toString().contains('Email Was Not verified')) {
        GenerateOtpService().generateOtp(_repo, emailController.text);
        globalContext
            ?.push("${PagePath.registerEmailOtp}/${emailController.text}");
        ToastMessage.message(e.toString(), type: ToastType.warn);

        return;
      }

      ToastMessage.message(e.toString());
    }

    if (ShowDialogBox.isOpen) {
      globalContext?.pop();
    }
  }
}

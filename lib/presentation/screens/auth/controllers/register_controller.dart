import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/registration_dto.dart';
import 'package:vendor_app/data/repository/auth_repository.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class RegisterController extends GetxController {
  final AuthRepository _repo = AuthRepositoryImpl();
  final obscure = false.obs;

  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  final VendorRegistrationDto registerModel = VendorRegistrationDto(
      vid: 1,
      vendortype: TextEditingController(),
      vendorCompanyName: TextEditingController(),
      vendoraddress: TextEditingController(),
      vendorCity: TextEditingController(),
      vendorRegion: TextEditingController(),
      vendorPostalcode: TextEditingController(),
      vendorMobileDetail: TextEditingController(),
      firstName: TextEditingController(),
      lastName: TextEditingController(),
      jobTitle: TextEditingController(),
      vendoremail: TextEditingController(),
      vendorPassword: TextEditingController(),
      isActive: true,
      serviceTypeId: 0);

  Future register() async {
    try {
      ShowDialogBox.showDialogBoxs(true);

      String res = await _repo.register(registerModel);
      if (res == "User Already Exist") {
        LocalStorageService.instance.logoutUser();
        globalContext?.go(PagePath.login);
        ToastMessage.message(res, type: ToastType.info);
        return;
      }
      ToastMessage.message(res, type: ToastType.success);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }

      if (res == "Vendor Registered Successfully!") {
        globalContext?.push(
            "${PagePath.registerEmailOtp}/${registerModel.vendoremail.text}");
      }
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }

  Future registerEmailOtp(String email, String otp) async {
    try {
      ShowDialogBox.showDialogBoxs(true);

      String res = await _repo.registerEmailVerification(email, otp);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }

      if (res == "Otp verified and Email Confirmed!") {
        globalContext?.go(PagePath.login);
      }
      if (res == "Otp Not Matched!") {
        ToastMessage.message(res, type: ToastType.error);
      }
      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

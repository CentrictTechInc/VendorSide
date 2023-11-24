import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<Placemark> geoAddress(Position pos) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);

    if (placemarks.isNotEmpty) {
      return placemarks[0];
    } else {
      return Placemark(name: "No Data Found!");
    }
  }

  getAddress() async {
    Position pos = await getLocation();
    Placemark placemark = await geoAddress(pos);

    registerModel.vendoraddress.text =
        "${placemark.street}, ${placemark.administrativeArea}, ${placemark.subAdministrativeArea}, ${placemark.country}";
  }

  @override
  void onClose() {
    super.onClose();
    registerModel.vendortype.dispose();
    registerModel.vendorCompanyName.dispose();
    registerModel.vendoraddress.dispose();
    registerModel.vendorCity.dispose();
    registerModel.vendorRegion.dispose();
    registerModel.vendorPostalcode.dispose();
    registerModel.vendorMobileDetail.dispose();
    registerModel.firstName.dispose();
    registerModel.lastName.dispose();
    registerModel.jobTitle.dispose();
    registerModel.vendoremail.dispose();
    registerModel.vendorPassword.dispose();
  }

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
        globalContext?.go(PagePath.category);
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

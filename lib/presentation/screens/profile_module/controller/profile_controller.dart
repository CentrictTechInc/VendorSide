import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/user_details_dto.dart';
import 'package:vendor_app/data/dto/user_dto.dart';
import 'package:vendor_app/data/repository/profile_repository.dart';
import 'package:vendor_app/domain/entity/user_details_model.dart';
import 'package:vendor_app/domain/repository/profile_repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository repo = ProfileRepositoryImpl();
  ProfileDetailsModel? user;
  File? file;

  @override
  void onReady() async {
    await getUserDetails();
    super.onReady();
  }

  // @override
  // void onInit() async {
  //   await getUserDetails();
  //   super.onInit();
  // }

  Future getUserDetails() async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      int id = LocalStorageService.instance.user!.vid!;
      ProfileDetailsModel user = await repo.getUserDetails(id);
      this.user = user;
      LocalStorageService.instance.user = UserDto(
        vendoraddress: user.vendoraddress,
        vendoremail: user.vendoremail,
        vendorMobileDetail: user.vendorMobileDetail,
        token: LocalStorageService.instance.user?.token,
        vid: LocalStorageService.instance.user?.vid,
        jobTitle: user.jobTitle,
        emailVerified: LocalStorageService.instance.user?.emailVerified,
        firstName: user.firstName,
        lastName: user.lastName,
      );

      update();
    } catch (e) {
      ToastMessage.message(e.toString());
    }
    if (ShowDialogBox.isOpen) {
      globalContext?.pop();
    }
  }

  Future postUserDetails(ProfileDetailsDto data) async {
    try {
      ShowDialogBox.showDialogBoxs(true);

      final res = await repo.postUserDetails(data, userPic: file);
      if (file!.path.isNotEmpty) {
        List<int> fileBytes = file!.readAsBytesSync();
        String base64String = base64Encode(fileBytes);
        LocalStorageService.instance.userPic = base64String;
      }
      update();
      globalContext?.pop();
      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    } finally {
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
    }
  }
}

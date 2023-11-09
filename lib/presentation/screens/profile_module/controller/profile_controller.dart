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
  UserDetails? user;
  File? file;
  Future getUserDetails() async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      int id = LocalStorageService.instance.user!.vid!;
      user = await repo.getUserDetails(id);
      LocalStorageService.instance.user = UserDto(
          vendoraddress: user!.address,
          vendoremail: LocalStorageService.instance.user!.vendoremail,
          vendorMobileDetail: user!.phone,
          token: LocalStorageService.instance.user!.token,
          vid: LocalStorageService.instance.user!.vid,
          jobTitle: "null",
          emailVerified: true);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
    if (ShowDialogBox.isOpen) {
      globalContext?.pop();
    }
  }

  Future postUserDetails(UserDetailsDto data) async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      final res = await repo.postUserDetails(data);
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      globalContext?.pop();
      ToastMessage.message(res, type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }
}

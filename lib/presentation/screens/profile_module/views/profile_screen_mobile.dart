import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/presentation/screens/profile_module/components/profile_item.dart';
import 'package:vendor_app/presentation/screens/profile_module/controller/profile_controller.dart';

class ProfileScreenMobile extends StatelessWidget {
  ProfileScreenMobile({super.key, required this.onPressed});
  final VoidCallback onPressed;
  final String? pic = LocalStorageService.instance.userPic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
          child: GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (c) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonAppBar(
                      backButton: false,
                      onDrawerPressed: onPressed,
                      hamburger: true,
                      text: "My Profile",
                      editButton: true,
                      onEdit: () {
                        context.push(PagePath.profile.toRoute +
                            PagePath.profileEdit.toRoute);
                      },
                    ),
                    // const VerticalSpacing(10),
                    Center(
                      child: Container(
                        width: 115,
                        height: 115,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey.withOpacity(0.5),
                              width: 0.25,
                            ),
                            borderRadius: BorderRadius.circular(70)),
                        child: c.user?.pictureData != null
                            ? CircleAvatar(
                                backgroundImage: c.user?.pictureData == null
                                    ? null
                                    : MemoryImage(
                                        base64Decode(c.user?.pictureData ?? ""),
                                      ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: NetWorkImageWithInitials(
                                  imageUrl: Drawables.personUrl,
                                  name:
                                      "${LocalStorageService.instance.user?.firstName?[0]}}",
                                ),
                              ),
                      ),
                    ),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "UserName",
                        text: "${c.user?.firstName} ${c.user?.lastName}",
                        icon: RGIcons.profile),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "Vendor Shop",
                        text: c.user?.vendorCompanyName ?? "",
                        icon: RGIcons.storeIcon),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "Location",
                        text: c.user?.vendoraddress ?? "",
                        icon: RGIcons.address),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "Email",
                        text: c.user?.vendoremail ?? "",
                        icon: RGIcons.email),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "Phone",
                        text: c.user?.vendorMobileDetail ?? "",
                        icon: RGIcons.phone),
                  ],
                );
              })),
    );
  }
}

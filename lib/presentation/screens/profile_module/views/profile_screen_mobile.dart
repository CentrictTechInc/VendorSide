import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/presentation/screens/profile_module/components/profile_item.dart';
import 'package:vendor_app/presentation/screens/profile_module/controller/profile_controller.dart';

class ProfileScreenMobile extends StatelessWidget {
  const ProfileScreenMobile({super.key, required this.onPressed});
  final VoidCallback onPressed;

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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: const NetWorkImageWithInitials(
                            imageUrl: Drawables.personUrl,
                            name: "Shaheer",
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "UserName",
                        text: "John Class",
                        icon: RGIcons.profile),
                    const VerticalSpacing(20),
                    const ProfileItem(
                        heading: "Vendor Shop",
                        text: "Star Auto Service",
                        icon: RGIcons.storeIcon),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "Location",
                        text: c.user?.address ?? "",
                        icon: RGIcons.address),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "Email",
                        text: c.user?.email ?? "",
                        icon: RGIcons.email),
                    const VerticalSpacing(20),
                    ProfileItem(
                        heading: "Phone",
                        text: c.user?.phone ?? "",
                        icon: RGIcons.phone),
                  ],
                );
              })),
    );
  }
}

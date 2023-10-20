import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/utils/common_back_button.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:sizer/sizer.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar(
      {super.key,
      this.backButton = true,
      this.hamburger = false,
      this.showProfile = false,
      this.onDrawerPressed,
      this.onEdit,
      // this.isText = false,
      this.hideBell = false,
      this.text = '',
      this.editButton = false,
      this.headFontSize});

  final bool backButton;
  final bool hamburger;
  final bool showProfile;
  final bool editButton;
  final bool hideBell;
  // final bool isText;
  final String text;
  final VoidCallback? onDrawerPressed;
  final VoidCallback? onEdit;
  final double? headFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Row(
        children: [
          if (backButton) ...[
            const CommonBackButton(),
            const HorizontalSpacing(10),
          ],
          hamburger
              ? Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                  child: InkWell(
                    onTap: onDrawerPressed,
                    borderRadius: BorderRadius.circular(12.0),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                      child: ImageIcon(
                        AssetImage(RGIcons.hamburger),
                        color: AppColors.secondary,
                        size: 40,
                      ),
                    ),
                  ))
              : const SizedBox(),
          if (text.isNotEmpty) ...[
            // const Spacer(),
            Expanded(
              flex: 4,
              child: CommonText(
                text: text,
                maxLines: 2,
                textAlign: TextAlign.center,
                fontSize: headFontSize ?? 15.sp,
                weight: FontWeight.w600,
              ),
            ),
          ],
          if (text.isEmpty) const Spacer(),
          editButton
              ? Container(
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.greyish,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: onEdit,
                    child: Image.asset(
                      RGIcons.editSquare,
                      color: AppColors.black,
                      height: 30,
                    ),
                  ),
                )
              : hideBell
                  ? const Spacer()
                  : IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => NotificationScreen(),
                        //     ));
                      },
                      splashColor: AppColors.grey.withOpacity(0.15),
                      highlightColor: AppColors.grey.withOpacity(0.15),
                      hoverColor: AppColors.grey.withOpacity(0.15),
                      icon: const ImageIcon(
                        AssetImage(RGIcons.notification),
                        color: AppColors.secondary,
                        size: 24,
                      )),
          if (showProfile)
            InkWell(
              onTap: () =>
                  context.go(PagePath.slash + PagePath.profile.toRoute),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey.withOpacity(0.5),
                      width: 0.25,
                    ),
                    borderRadius: BorderRadius.circular(70)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: LocalStorageService.instance.userPic != null
                      ? CircleAvatar(
                          backgroundImage: LocalStorageService
                                      .instance.userPic ==
                                  null
                              ? null
                              : FileImage(
                                  File(LocalStorageService.instance.userPic!),
                                ),
                        )
                      : NetWorkImageWithInitials(
                          imageUrl:
                              "https://zakrademos.com/professional/wp-content/uploads/sites/46/2021/02/team2.jpg",
                          name: LocalStorageService.instance.user?.vendoremail,
                        ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

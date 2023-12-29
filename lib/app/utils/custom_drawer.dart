import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/network_image_with_initials.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/presentation/screens/dashboard/main_dashboard.dart';
import 'package:vendor_app/presentation/screens/dashboard/controller/botton_nav_controller.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });
  final String? pic = LocalStorageService.instance.userPic;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      width: 280,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
      ),
      child: Column(children: [
        Container(
          height: 240,
          decoration: const BoxDecoration(
              color: AppColors.primary,
              image: DecorationImage(
                  image: AssetImage(Drawables.logoBackground),
                  fit: BoxFit.fitWidth)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacing(30),
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey.withOpacity(0.5),
                            width: 0.25,
                          ),
                          borderRadius: BorderRadius.circular(70)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: NetWorkImageWithInitials(
                          imageData: LocalStorageService.instance.userPic,
                          imageUrl: Drawables.personUrl,
                          name: "a",
                          backgroundColor: AppColors.whiteGreyish,
                          textColor: AppColors.black,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    const VerticalSpacing(15),
                    CommonText(
                      text:
                          '${LocalStorageService.instance.user?.firstName} ${LocalStorageService.instance.user?.lastName}',
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                      color: AppColors.white,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(top: 25, left: 0),
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close_rounded),
                        color: AppColors.white,
                        onPressed: () {
                          if (GoRouterState.of(context).uri.toString() ==
                              PagePath.homeScreen) {
                            if (globalScaffoldKey.currentState!.isDrawerOpen) {
                              globalScaffoldKey.currentState!.closeDrawer();
                            }
                          } else {
                            context.pop();
                          }
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            constraints: BoxConstraints(maxHeight: context.height),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5)),
                    shrinkWrap: true,
                    itemCount: drawer.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return drawer[index]
                        ..highlighted =
                            GoRouterState.of(context).uri.toString() ==
                                drawer[index].location
                        ..onTap = () async {
                          final controller = Get.find<BottomNavController>();
                          controller.changeTabIndex(0);
                          context.pop();
                          if (GoRouterState.of(context).uri.toString() !=
                              drawer[index].location) {
                            if (context.mounted) {
                              context.go(drawer[index].location);
                            }
                            await Future.delayed(
                                const Duration(milliseconds: 250));
                            controller.changeTabIndex(0);
                          } else if (controller.tabIndex.value != 0) {
                            controller.changeTabIndex(0);
                            if (context.mounted) {
                              globalScaffoldKey.currentState!.closeDrawer();
                            }
                          }
                        };
                    },
                  ),
                  const VerticalSpacing(20),
                  InkWell(
                    onTap: () async => {
                      await LocalStorageService.instance.logoutUser(),
                      if (context.mounted) {context.go(PagePath.login)}
                    },
                    child: Row(
                      children: [
                        const HorizontalSpacing(15),
                        const ImageIcon(
                          AssetImage(RGIcons.logout),
                          color: AppColors.red,
                          size: 30,
                        ),
                        const HorizontalSpacing(15),
                        CommonText(
                          text: "Logout",
                          fontSize: 12.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacing(20)
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  final List<DrawerItem> drawer = [
    DrawerItem(
      location: PagePath.homeScreen,
      text: "Home",
      icon: RGIcons.homeIcon,
    ),
    DrawerItem(
      location: PagePath.profile.tohome,
      text: "My Profile",
      icon: RGIcons.profileIcon,
    ),
    DrawerItem(
      location: PagePath.review.tohome,
      text: "Customer Reviews",
      icon: RGIcons.review,
    ),
    DrawerItem(
      location: PagePath.tasks.tohome,
      text: "My Tasks",
      icon: RGIcons.tasks,
    ),
    DrawerItem(
      location: PagePath.contact.tohome,
      text: "Contact Us",
      icon: RGIcons.callIcon,
    ),
    DrawerItem(
      location: PagePath.schedule.tohome,
      text: "Schedule",
      icon: RGIcons.calendarMonth,
    ),
    LocalStorageService.instance.user?.vendorType == 2
        ? DrawerItem(
            location: PagePath.manageServices.tohome,
            text: "Manage Services 1",
            icon: RGIcons.dollar,
          )
        : DrawerItem(
            location: PagePath.automotiveManageServices.tohome,
            text: "Manage Services 2",
            icon: RGIcons.dollar,
          ),
    DrawerItem(
      location: PagePath.manageAccount.tohome,
      text: "Manage Accounts",
      icon: RGIcons.accountTabIcon,
    ),
  ];
}

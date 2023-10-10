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
import 'package:vendor_app/presentation/screens/bottom_nav/Main_screen.dart';
import 'package:vendor_app/presentation/screens/bottom_nav/controller/botton_nav_controller.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });

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
                        child: const NetWorkImageWithInitials(
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
                      text: 'Mrs. Hussain',
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
                          context.pop();
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.separated(
          separatorBuilder: (context, index) =>
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          shrinkWrap: true,
          itemCount: drawer.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return drawer[index]
              ..highlighted = GoRouterState.of(context).uri.toString() ==
                  drawer[index].location
              ..onTap = () async {
                final controller = Get.find<BottomNavController>();
                if (GoRouterState.of(context).uri.toString() !=
                    drawer[index].location) {
                  context.pop();
                  if (context.mounted) {
                    context.go(drawer[index].location);
                  }
                  await Future.delayed(const Duration(milliseconds: 250));
                  controller.changeTabIndex(0);
                } else if (controller.tabIndex.value != 0) {
                  controller.changeTabIndex(0);
                  if (context.mounted) {
                    globalScaffoldKey.currentState!.closeDrawer();
                  }
                }
              };
          },
        )),
        InkWell(
          onTap: () => {
            LocalStorageService.instance.logoutUser(),
            context.go(PagePath.login)
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
      ]),
    );
  }

  final List<DrawerItem> drawer = [
    DrawerItem(
      location: PagePath.slash,
      text: "Home",
      icon: RGIcons.home,
    ),
    DrawerItem(
      location: PagePath.profile.toRoute,
      text: "My Profile",
      icon: RGIcons.profile,
    ),
    DrawerItem(
      location: PagePath.review.toRoute,
      text: "Customer Reviews",
      icon: RGIcons.review,
    ),
    DrawerItem(
      location: PagePath.tasks.toRoute,
      text: "My Tasks",
      icon: RGIcons.tasks,
    ),
    DrawerItem(
      location: PagePath.contact.toRoute,
      text: "Contact Us",
      icon: RGIcons.callIcon,
    ),
    DrawerItem(
      location: PagePath.schedule.toRoute,
      text: "Schedule",
      icon: RGIcons.calendarMonth,
    ),
    DrawerItem(
      location: PagePath.manageServices.toRoute,
      text: "Manage Services",
      icon: RGIcons.dollar,
    ),
  ];
}

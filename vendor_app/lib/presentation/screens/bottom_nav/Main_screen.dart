import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/presentation/screens/bottom_nav/components/bottom_navigation_bar.dart';
import 'package:vendor_app/presentation/screens/bottom_nav/controller/botton_nav_controller.dart';
import 'package:vendor_app/presentation/screens/business/business_screen.dart';
import 'package:vendor_app/presentation/screens/chat/inbox_screen.dart';
import 'package:vendor_app/presentation/screens/home/components/confirmation_dialogue.dart';
import 'package:vendor_app/presentation/screens/home/home_screen.dart';
import 'package:vendor_app/presentation/screens/notification/notification_screen.dart';

final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

class MainBottomNavScreen extends StatelessWidget {
  const MainBottomNavScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          bool closeConfirmed = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CloseConfirmationDialogue();
            },
          );
          return closeConfirmed;
        },
        child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
            },
            child: Scaffold(
              key: globalScaffoldKey,
              extendBody: true,
              resizeToAvoidBottomInset: false,
              drawer: CustomDrawer(),
              bottomNavigationBar: HomeBottomNavBar(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.go(PagePath.tasks);
                },
                backgroundColor: AppColors.primary,
                shape: const CircleBorder(eccentricity: .9),
                child: const ImageIcon(
                  AssetImage(RGIcons.fabIcon),
                  color: AppColors.white,
                  size: 30,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              backgroundColor: AppColors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    Text("data"),
                    Expanded(
                      child: CommonAppBar(
                        backButton: false,
                        hamburger: true,
                        text: "Tasks",
                        onDrawerPressed: () {},
                        hideBell: true,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: GetBuilder(
                        init: BottomNavController(),
                        builder: (BottomNavController controller) {
                          return Obx(() {
                            return PageView(
                              controller: controller.pageController,
                              physics: NeverScrollableScrollPhysics(),
                              // index: controller.tabIndex.value,
                              children: [
                                HomeScreen(),
                                BusinessScreen(),
                                InboxScreen(),
                                NotificationScreen(),
                              ],
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}

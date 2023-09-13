import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/presentation/screens/bottom_navigation_bar.dart';
import 'package:vendor_app/presentation/screens/home/components/confirmation_dialogue.dart';
import 'package:vendor_app/presentation/screens/home/views/home_screen_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get ref => null;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
            key: scaffoldKey,
            extendBody: true,
            resizeToAvoidBottomInset: false,
            drawer: CustomDrawer(),
            bottomNavigationBar: HomeBottomNavBar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ServicesScreen(),
                //     ));
              },
              backgroundColor: AppColors.primary,
              shape: const CircleBorder(eccentricity: .9),
              child: const ImageIcon(
                AssetImage(RGIcons.services),
                color: AppColors.white,
                size: 50,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            backgroundColor: AppColors.white,
            body: SafeArea(
                maintainBottomViewPadding: true,
                child: Responsive(
                    mobile: HomeScreenMobile(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    tablet: const HomeScreenMobile(),
                    desktop: const HomeScreenMobile()))),
      ),
    );
  }
}

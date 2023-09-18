import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/presentation/screens/bottom_navigation_bar.dart';
import 'package:vendor_app/presentation/screens/home/components/confirmation_dialogue.dart';

final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

class MainBottomNavScreen extends StatelessWidget {
  final Widget widget;

  const MainBottomNavScreen({super.key, required this.widget});

  get ref => null;

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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => (),
                //     ));
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
            body: widget),
      ),
    );
  }
}

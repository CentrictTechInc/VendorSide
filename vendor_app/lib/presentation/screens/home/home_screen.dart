import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/bottom_nav_screen.dart';
import 'package:vendor_app/presentation/screens/home/views/home_screen_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get ref => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        maintainBottomViewPadding: true,
        child: Responsive(
            mobile: HomeScreenMobile(
              onPressed: () {
                globalScaffoldKey.currentState?.openDrawer();
              },
            ),
            tablet: HomeScreenMobile(),
            desktop: HomeScreenMobile()));
  }
}

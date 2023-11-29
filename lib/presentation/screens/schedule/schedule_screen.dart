import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/schedule/views/schedule_mobile_screen.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Responsive(
              mobile: ScheduleMobileScreen(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              tablet: ScheduleMobileScreen(),
              desktop: ScheduleMobileScreen())),
    );
  }
}

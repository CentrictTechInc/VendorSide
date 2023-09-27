import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/bottom_nav/Main_screen.dart';
import 'package:vendor_app/presentation/screens/schedule/views/schedule_mobile_screen.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Responsive(
            mobile: ScheduleMobileScreen(
              onPressed: () {
                globalScaffoldKey.currentState!.openDrawer();
              },
            ),
            tablet: ScheduleMobileScreen(),
            desktop: ScheduleMobileScreen()));
  }
}

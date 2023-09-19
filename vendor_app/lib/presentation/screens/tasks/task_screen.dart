import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/bottom_nav_screen.dart';
import 'package:vendor_app/presentation/screens/tasks/views/tasks_mobile.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Responsive(
            mobile: TasksMobileScreen(
              onPressed: () {
                globalScaffoldKey.currentState!.openDrawer();
              },
            ),
            tablet: TasksMobileScreen(),
            desktop: TasksMobileScreen()));
  }
}

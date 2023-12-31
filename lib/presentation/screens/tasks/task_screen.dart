import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/tasks/views/tasks_mobile.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Responsive(
              mobile: TasksMobileScreen(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              tablet: TasksMobileScreen(),
              desktop: TasksMobileScreen())),
    );
  }
}

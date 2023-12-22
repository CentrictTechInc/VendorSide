import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/automotive_manage_services/views/auto_manage_services_mobile.dart';

class ManageAmServicesScreen extends StatelessWidget {
  ManageAmServicesScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Responsive(
              mobile: ManageAmServicesMobileScreen(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              tablet: const ManageAmServicesMobileScreen(),
              desktop: const ManageAmServicesMobileScreen())),
    );
  }
}

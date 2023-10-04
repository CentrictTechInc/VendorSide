import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/manage_services/views/manage_services_mobile.dart';

class ManageServicesScreen extends StatelessWidget {
  ManageServicesScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Responsive(
              mobile: ManageServicesMobileScreen(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              tablet: ManageServicesMobileScreen(),
              desktop: ManageServicesMobileScreen())),
    );
  }
}

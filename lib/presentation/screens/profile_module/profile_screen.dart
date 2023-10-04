import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/profile_module/views/profile_screen_mobile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Responsive(
              mobile: ProfileScreenMobile(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              tablet: ProfileScreenMobile(
                onPressed: () {},
              ),
              desktop: ProfileScreenMobile(
                onPressed: () {},
              ))),
    );
  }
}

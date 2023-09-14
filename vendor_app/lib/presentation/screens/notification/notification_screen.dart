import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/profile_module/views/profile_screen_mobile.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Responsive(
            mobile: ProfileScreenMobile(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            tablet: Text("hello"),
            desktop: Text("hello")));
  }
}

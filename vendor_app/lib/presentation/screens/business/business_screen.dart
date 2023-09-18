import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/bottom_nav_screen.dart';
import 'package:vendor_app/presentation/screens/business/views/my_business_mobile_screen.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Responsive(
            mobile: BusinessScreenMobile(
              onPressed: () {
                globalScaffoldKey.currentState?.openDrawer();
              },
            ),
            tablet: BusinessScreenMobile(),
            desktop: BusinessScreenMobile()));
  }
}

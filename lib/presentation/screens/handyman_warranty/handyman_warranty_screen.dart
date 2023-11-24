import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/views/handyman_waranty_mobile.dart';

class HandymanWarrantyScreen extends StatelessWidget {
  const HandymanWarrantyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive(
            mobile: HandymanWarantyMobileScreen(),
            tablet: HandymanWarantyMobileScreen(),
            desktop: HandymanWarantyMobileScreen()),
      ),
    );
  }
}

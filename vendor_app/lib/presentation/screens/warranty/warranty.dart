import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/warranty/views/waranty_mobile.dart';

class WarrantyScreen extends StatelessWidget {
  const WarrantyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive(
            mobile: WarantyMobileScreen(),
            tablet: WarantyMobileScreen(),
            desktop: WarantyMobileScreen()),
      ),
    );
  }
}

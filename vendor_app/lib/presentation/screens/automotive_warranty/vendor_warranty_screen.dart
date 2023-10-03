import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/views/vendor_warranty_mobile.dart';

class AutomotiveWarrantyScreen extends StatelessWidget {
  const AutomotiveWarrantyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive(
            mobile: AutomotiveWarantyMobileScreen(),
            tablet: AutomotiveWarantyMobileScreen(),
            desktop: AutomotiveWarantyMobileScreen()),
      ),
    );
  }
}

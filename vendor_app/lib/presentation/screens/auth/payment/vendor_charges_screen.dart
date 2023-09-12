import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/auth/payment/views/vendor_charges_mobile.dart';

class VendorChargesScreen extends StatelessWidget {
  const VendorChargesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Responsive(
            mobile: VendorChargesMobile(),
            tablet: VendorChargesMobile(),
            desktop: VendorChargesMobile()),
      ),
    );
  }
}

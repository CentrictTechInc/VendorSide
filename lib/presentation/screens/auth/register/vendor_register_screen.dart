import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/auth/register/views/register_mobile.dart';

class VendorRegisterScreen extends StatelessWidget {
  const VendorRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Responsive(
            mobile: RegisterMobile(),
            tablet: RegisterMobile(),
            desktop: RegisterMobile()),
      ),
    );
  }
}

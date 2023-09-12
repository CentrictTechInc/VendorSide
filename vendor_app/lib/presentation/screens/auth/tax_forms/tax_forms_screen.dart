import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/auth/tax_forms/views/tax_forms_mobile.dart';

class TaxFormScreen extends StatelessWidget {
  const TaxFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Responsive(
            mobile: TaxFormMobile(),
            tablet: TaxFormMobile(),
            desktop: TaxFormMobile()),
      ),
    );
  }
}

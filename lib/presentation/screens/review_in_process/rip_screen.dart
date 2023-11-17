import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/review_in_process/views/rip_mobile.dart';

class ReviewInProcessScreen extends StatelessWidget {
  ReviewInProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Responsive(
              mobile: RIPMobile(), tablet: RIPMobile(), desktop: RIPMobile())),
    );
  }
}

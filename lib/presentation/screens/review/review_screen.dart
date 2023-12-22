import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/review/views/review_mobile.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.white,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Responsive(
              mobile: ReviewMobile(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              tablet: const ReviewMobile(),
              desktop: const ReviewMobile())),
    );
  }
}

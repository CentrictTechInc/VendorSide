import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/contact_us/views/contact_us_mobile.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.white,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Responsive(
              mobile: ContactUsMobile(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              tablet: const ContactUsMobile(),
              desktop: const ContactUsMobile())),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'views/edit_profile_mobile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Responsive(
              mobile: EditProfileScreenMobile(),
              tablet: EditProfileScreenMobile(),
              desktop: EditProfileScreenMobile())),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/views/automotive_warranty_mobile.dart';
import 'package:vendor_app/presentation/screens/home/components/confirmation_dialogue.dart';

class AutomotiveWarrantyScreen extends StatelessWidget {
  const AutomotiveWarrantyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool closeConfirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CloseConfirmationDialogue();
          },
        );

        return closeConfirmed;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Responsive(
              mobile: AutomotiveWarantyMobileScreen(),
              tablet: AutomotiveWarantyMobileScreen(),
              desktop: AutomotiveWarantyMobileScreen()),
        ),
      ),
    );
  }
}

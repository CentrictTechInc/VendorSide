import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/home/components/confirmation_dialogue.dart';
import 'package:vendor_app/presentation/screens/tax_forms/views/tax_forms_mobile.dart';

class TaxFormScreen extends StatelessWidget {
  const TaxFormScreen({super.key});

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
        backgroundColor: AppColors.secondary,
        body: SafeArea(
          child: Responsive(
              mobile: TaxFormMobile(),
              tablet: TaxFormMobile(),
              desktop: TaxFormMobile()),
        ),
      ),
    );
  }
}

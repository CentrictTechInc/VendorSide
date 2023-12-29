import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/custom_drawer.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/manage_accounts/views/manage_accounts_mobile.dart';

class ManageAccountsScreen extends StatelessWidget {
  ManageAccountsScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Responsive(
              mobile: ManageAccountsMobile(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              tablet: const ManageAccountsMobile(),
              desktop: const ManageAccountsMobile())),
    );
  }
}

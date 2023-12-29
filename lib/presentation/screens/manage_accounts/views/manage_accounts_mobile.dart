import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class ManageAccountsMobile extends StatelessWidget {
  const ManageAccountsMobile({this.onPressed, super.key});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            text: 'Manage Accounts',
            hamburger: true,
            onDrawerPressed: onPressed,
            backButton: false,
            hideBell: true,
          ),
          const VerticalSpacing(15),
          CommonText(
              text: "Add new account",
              fontSize: 12.sp,
              weight: FontWeight.w600),
          const VerticalSpacing(15),
          AccountsCard(
            icon: Drawables.squareAcc,
            text: "Square Account",
            onTap: () {},
          ),
          const VerticalSpacing(15),
          AccountsCard(
            icon: Drawables.payoneerAcc,
            text: "Payoneer Account",
            onTap: () {},
          ),
          const VerticalSpacing(15),
          AccountsCard(
            icon: Drawables.paypalAcc,
            text: "Paypal Account",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class AccountsCard extends StatelessWidget {
  const AccountsCard({
    this.onTap,
    this.text = '',
    this.icon = '',
    super.key,
  });

  final VoidCallback? onTap;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: AppColors.greyish),
          child: Row(
            children: [
              const HorizontalSpacing(10),
              Image.asset(
                icon,
                fit: BoxFit.contain,
                cacheHeight: 30,

                // color: AppColors.primaryText,
                // size: 25,
              ),
              const HorizontalSpacing(25),
              CommonText(
                text: text,
                fontSize: 14.sp,
                weight: FontWeight.w500,
                color: AppColors.primaryText,
              ),
              const Spacer(),
              ImageIcon(
                const AssetImage(
                  RGIcons.plusIcon,
                ),
                color: AppColors.primaryText,
                size: 2.5.h,
              ),
              const HorizontalSpacing(10),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/presentation/screens/auth/login/login_screen.dart';
import 'package:vendor_app/presentation/screens/home/components/vendor_details_card.dart';

class BusinessScreenMobile extends StatelessWidget {
  BusinessScreenMobile({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CommonAppBar(
            hamburger: true,
            onDrawerPressed: onPressed,
            backButton: false,
            text: "My Business",
            hideBell: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.greyish),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                mainAxisExtent: 120,
                                crossAxisCount: 2),
                        shrinkWrap: true,
                        itemCount: cards.length,
                        itemBuilder: (context, i) {
                          return cards[i];
                        }),
                  ),
                  const VerticalSpacing(30.0),
                  Container(
                    height: 2,
                    color: AppColors.whiteish,
                  ),
                  const VerticalSpacing(15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "100%",
                        color: AppColors.primaryText,
                        fontSize: 30,
                        weight: FontWeight.w600,
                      ),
                      HorizontalSpacing(5),
                      CommonText(
                        text: "Reliability Rate",
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  const VerticalSpacing(15),
                  const VerticalSpacing(120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // list<VendorDetailsCard> = [

  final List<VendorDetailsCard> cards = [
    VendorDetailsCard(
      amount: "250",
      icon: RGIcons.moneyIcon,
      subTitle: "Total Booking".toUpperCase(),
      isBlue: true,
    ),
    VendorDetailsCard(
      amount: "190",
      icon: RGIcons.dollar,
      subTitle: "Completed Services".toUpperCase(),
      isBlue: true,
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/presentation/screens/home/components/vendor_details_card.dart';

class BusinessScreenMobile extends StatelessWidget {
  BusinessScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.greyish),
            child: Column(
              children: [
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 15,
                            mainAxisExtent: 100,
                            crossAxisCount: 2),
                    shrinkWrap: true,
                    itemCount: cards.length,
                    itemBuilder: (context, i) {
                      return cards[i];
                    }),
                const VerticalSpacing(30.0),
                Container(
                  height: 2,
                  color: AppColors.whiteish,
                ),
                const VerticalSpacing(15),
                const CommonText(
                  text: "Current Metrics",
                  color: AppColors.primaryText,
                  fontSize: 16,
                  weight: FontWeight.w600,
                ),
                const VerticalSpacing(15),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.grey,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          children: [
                            CommonText(
                              text: "80%",
                              color: AppColors.white,
                              fontSize: 18,
                              weight: FontWeight.w600,
                            ),
                            VerticalSpacing(5),
                            CommonText(
                              text: "RESPONSE",
                              color: AppColors.white,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: AppColors.black,
                      ),
                      HorizontalSpacing(10),
                      const Expanded(
                        child: Column(
                          children: [
                            CommonText(
                              text: "100%",
                              color: AppColors.white,
                              fontSize: 18,
                              weight: FontWeight.w600,
                            ),
                            VerticalSpacing(5),
                            CommonText(
                              text: "ACCEPTANCE",
                              color: AppColors.white,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                      HorizontalSpacing(10),
                      Container(
                        height: 40,
                        width: 1,
                        color: AppColors.black,
                      ),
                      const Expanded(
                        child: Column(
                          children: [
                            CommonText(
                              text: "95%",
                              color: AppColors.white,
                              fontSize: 18,
                              weight: FontWeight.w600,
                            ),
                            VerticalSpacing(5),
                            CommonText(
                              text: "Reliability",
                              color: AppColors.white,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      RGIcons.smiley,
                    ),
                    HorizontalSpacing(3.5),
                    CommonText(
                      text: "Excellent work keeping your clients happy!",
                      fontSize: 9.sp,
                      weight: FontWeight.w400,
                    )
                  ],
                ),
                const VerticalSpacing(50),
                Container(
                  height: 1,
                  color: AppColors.whiteish,
                ),
                const VerticalSpacing(15),
                const Row(
                  children: [
                    Spacer(),
                    CommonText(
                      text: "Ratings and Reviews",
                      fontSize: 16,
                      weight: FontWeight.w600,
                    ),
                    Spacer(),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.grey,
                    )
                  ],
                ),
                const VerticalSpacing(20),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 15,
                            mainAxisExtent: 100,
                            crossAxisCount: 2),
                    shrinkWrap: true,
                    itemCount: cards.length,
                    itemBuilder: (context, i) {
                      return bottomCards[i];
                    }),
                VerticalSpacing(20),
              ],
            ),
          ),
          const VerticalSpacing(80),
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
  final List<VendorDetailsCard> bottomCards = [
    VendorDetailsCard(
      amount: "90%",
      icon: RGIcons.moneyIcon,
      subTitle: "Positive Reviews".toUpperCase(),
      color: AppColors.primary,
      textColor: AppColors.white,
    ),
    VendorDetailsCard(
      amount: "190",
      icon: RGIcons.dollar,
      subTitle: "Review count".toUpperCase(),
      color: AppColors.primary,
      textColor: AppColors.white,
    ),
  ];
}

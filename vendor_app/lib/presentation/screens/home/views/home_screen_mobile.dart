import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/presentation/screens/auth/login/login_screen.dart';
import 'package:vendor_app/presentation/screens/home/components/vendor_details_card.dart';

class HomeScreenMobile extends StatelessWidget {
  HomeScreenMobile({super.key, this.onPressed});
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
            showProfile: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage(RGIcons.location1),
                        color: AppColors.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 5),
                      CommonText(
                        text: "New York",
                        fontSize: 10.sp,
                        letterSpacing: 0.7,
                        color: AppColors.grey,
                      )
                    ],
                  ),
                  const VerticalSpacing(15),
                  const CommonText(
                    text: "Hello, Demo Admin",
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                  const VerticalSpacing(5),
                  const CommonText(
                    text: "Welcome back!",
                    fontSize: 12,
                    color: AppColors.grey,
                  ),
                  const VerticalSpacing(15),
                  Container(
                    height: 2,
                    color: AppColors.whiteish,
                  ),
                  const VerticalSpacing(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "Today's Scheduled Tasks",
                        color: AppColors.primaryText,
                        fontSize: 12.sp,
                        weight: FontWeight.w600,
                        letterSpacing: 0.52,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        splashColor: Colors.transparent,
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: AppColors.secondary, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 7.5),
                            child: CommonText(
                              text: "View all",
                              color: AppColors.secondary,
                              fontSize: 6.sp,
                              decoration: TextDecoration.none,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: AppColors.primaryGradient),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grey.withOpacity(0.2),
                            blurRadius: 2.0),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Muhammad Saqib",
                                    fontSize: 11.sp,
                                    color: AppColors.white,
                                    weight: FontWeight.w600,
                                  ),
                                  const VerticalSpacing(15.0),
                                  CommonText(
                                    text: "509 Unit 10, New Haven, CT 06530",
                                    fontSize: 8.sp,
                                    color: AppColors.white,
                                    weight: FontWeight.w300,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(7.5),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border:
                                            Border.all(color: AppColors.white),
                                      ),
                                      child: CommonText(
                                        text: "10: 00 AM",
                                        fontSize: 10.sp,
                                        weight: FontWeight.w600,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    const VerticalSpacing(10.0),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.5, horizontal: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: AppColors.white),
                                      child: CommonText(
                                        text: "Wed, May 17",
                                        fontSize: 10.sp,
                                        weight: FontWeight.w600,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        CommonText(
                          text: "Service",
                          fontSize: 9.sp,
                          color: AppColors.white,
                          weight: FontWeight.w600,
                        ),
                        const VerticalSpacing(5.0),
                        CommonText(
                          text: "Check engine light is on (general diagnosis)",
                          fontSize: 8.sp,
                          color: AppColors.white,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
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
                  Container(
                    height: 2,
                    color: AppColors.whiteish,
                  ),
                  const VerticalSpacing(30),
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
        icon: RGIcons.bookingIcon,
        subTitle: "Total Booking".toUpperCase()),
    VendorDetailsCard(
        amount: "190",
        icon: RGIcons.serviceIcon,
        subTitle: "Completed Services".toUpperCase()),
    VendorDetailsCard(
        amount: "\$1550.47",
        icon: RGIcons.moneyIcon,
        subTitle: "Monthly Earnings".toUpperCase()),
    VendorDetailsCard(
        amount: "\$150.31",
        icon: RGIcons.tipsIcon,
        subTitle: "Total Tips".toUpperCase()),
  ];
}

import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/components/price_widget.dart';

class AutomotiveServicePricing extends StatelessWidget {
  const AutomotiveServicePricing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacing(20),
        const CommonText(
          text: Strings.rgServicePricedisclamer,
          fontSize: 11,
          color: AppColors.grey,
        ),
        ServicePricingWidget(),
        ServicePricingWidget(),
        ServicePricingWidget(),
      ],
    );
  }
}

class ServicePricingWidget extends StatelessWidget {
  const ServicePricingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextRow(
          text: 'Oil Change Service',
          icon: RGIcons.oilBarrel,
        ),
        const CommonText(
          text: Strings.oilChnagePrice,
          fontSize: 11,
          color: AppColors.grey,
        ),
        const VerticalSpacing(20),
        SubServicePricing(),
        SubServicePricing(),
        SubServicePricing(),
        SubServicePricing(),
      ],
    );
  }
}

class SubServicePricing extends StatelessWidget {
  const SubServicePricing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonText(
          text: "A. Conventional Oil and Filter Change",
          fontSize: 12,
        ),
        const VerticalSpacing(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PriceWidget(
              color: AppColors.whiteGreyish,
            ),
            PriceWidget(
              color: AppColors.whiteGreyish,
              text: "You'll be Paid",
            ),
          ],
        ),
        const VerticalSpacing(15),
      ],
    );
  }
}

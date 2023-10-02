import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget({super.key, this.text, this.price});
  String? text;
  String? price;
  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.,
      children: [
        CommonText(
          text: "\n\$",
          fontSize: 18,
          weight: FontWeight.w500,
        ),
        const HorizontalSpacing(6),
        Column(
          children: [
            CommonText(
              text: text ?? "Service Charges",
              fontSize: 11,
            ),
            const VerticalSpacing(6),
            Container(
              width: 152,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Center(
                child: CommonText(
                  text: price ?? "50",
                  fontSize: 14,
                  weight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

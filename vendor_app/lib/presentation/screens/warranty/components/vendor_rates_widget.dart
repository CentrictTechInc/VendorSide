import 'package:flutter/material.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_dropdown.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class VendorRatesWidget extends StatelessWidget with FieldsValidation {
  const VendorRatesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.greyish),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CommonText(
          text: "Select your area",
          fontSize: 14,
        ),
        const VerticalSpacing(10),
        DropDownWidget(
          dropDownHeight: 50,
          validator: validateTextOnlyDropdown,
          arryList: [],
          showSearchBox: true,
          compareFn: (value1, value2) {
            return value1 == value2;
          },
          itemAsString: (p0) {
            return p0;
          },
          fillColor: AppColors.white,
          isFilledColor: true,
          onChanged: (value) async {},
          suffixSearchIcon: RGIcons.search,
          hintText: "Select Your Working Location",
        ),
        const VerticalSpacing(30),
        const CommonText(
          text: "Choose Your Category",
          fontSize: 14,
        ),
        const VerticalSpacing(10),
        DropDownWidget(
          dropDownHeight: 50,
          validator: validateTextOnlyDropdown,
          arryList: [],
          showSearchBox: true,
          compareFn: (value1, value2) {
            return value1 == value2;
          },
          itemAsString: (p0) {
            return p0;
          },
          fillColor: AppColors.white,
          isFilledColor: true,
          onChanged: (value) async {},
          suffixSearchIcon: RGIcons.search,
          hintText: "Select Your Category",
        ),
        const VerticalSpacing(30),
        const CommonText(
          text: "Your Hourly Rate",
          fontSize: 14,
        ),
        const VerticalSpacing(10),
        Row(
          children: [
            // PriceWidget(),
            // const HorizontalSpacing(15),
            // PriceWidget(
            //   price: "42.5",
            //   text: "You’ll be paid",
            // ),
          ],
        ),
      ]),
    );
  }
}

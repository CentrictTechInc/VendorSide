import 'package:flutter/material.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_dropdown.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

class VendorRatesWidget extends StatelessWidget with FieldsValidation {
  const VendorRatesWidget(
      {super.key,
      this.onChanged,
      this.controller,
      this.ddList,
      this.validator,
      this.selectedItem,
      this.editable = true,
      required this.child});
  final dynamic Function(dynamic)? onChanged;
  final TextEditingController? controller;
  final List<dynamic>? ddList;
  final String? Function(String?)? validator;
  final String? selectedItem;
  final Widget child;
  final bool editable;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.greyish),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CommonText(
          text: "Select Your Area",
          fontSize: 14,
        ),
        const VerticalSpacing(10),
        // todo: area dropdown might become a search dropdown in future
        // DropDownWidget(
        //   dropDownHeight: 50,
        //   validator: validateTextOnlyDropdown,
        //   arryList: [],
        //   showSearchBox: true,
        //   compareFn: (value1, value2) {
        //     return value1 == value2;
        //   },
        //   itemAsString: (p0) {
        //     return p0;
        //   },
        //   fillColor: AppColors.white,
        //   isFilledColor: true,
        //   onChanged: (value) async {},
        //   suffixSearchIcon: RGIcons.search,
        //   hintText: "Select Your Working Location",
        // ),
        TextFormField(
          controller: controller,
          validator: validator,
          readOnly: !editable,
          decoration: const InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: "Enter Your Working Location",
            hintStyle: TextStyle(
                color: AppColors.grey, fontSize: 14, fontFamily: 'Sora'),
          ),
          onChanged: (value) {
            // Handle the change
          },
        ),
        const VerticalSpacing(30),
        const CommonText(
          text: "Choose Your Service",
          fontSize: 14,
        ),
        const VerticalSpacing(10),
        DropDownWidget(
          dropDownHeight: 58,
          maxHeight: 250,
          enabled: editable,
          validator: validateTextOnlyDropdown,
          arryList: ddList ?? [],
          showSearchBox: true,
          compareFn: (value1, value2) {
            return value1 == value2;
          },
          itemAsString: (p0) {
            // print(p0);
            return p0;
          },
          fillColor: AppColors.white,
          isFilledColor: true,
          onChanged: onChanged,
          selectedItem: selectedItem,
          suffixSearchIcon: RGIcons.search,
          hintText: "Select Your Category",
        ),
        const VerticalSpacing(30),
        const CommonText(
          text: "Your Hourly Rate",
          fontSize: 14,
        ),
        const VerticalSpacing(10),
        child
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_dropdown.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/presentation/screens/manage_services/controller/manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/components/price_widget.dart';

class MyAmServicesScreen extends StatelessWidget with FieldsValidation {
  MyAmServicesScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //     maxWidth: context.width,
      //     maxHeight: context.height,
      //     minHeight: context.height),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.greyish),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CommonText(
            text: "Select your area",
            fontSize: 14,
          ),
          const VerticalSpacing(10),
          DropDownWidget(
            validator: validateTextOnlyDropdown,
            arryList: const [
              "New York",
              "New Jersey",
              "California",
              "Texas",
              "Florida"
            ],
            showSearchBox: true,
            selectedItem: "New York",
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
            text: "Choose Your Services",
            fontSize: 14,
          ),
          const VerticalSpacing(10),
          DropDownWidget(
            validator: validateTextOnlyDropdown,
            arryList: const ["Capertry", "Plumbing", "Electrician", "Painting"],
            showSearchBox: true,
            compareFn: (value1, value2) {
              return value1 == value2;
            },
            itemAsString: (p0) {
              return p0;
            },
            selectedItem: "Capertry",
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
          GetBuilder<ManageServicesController>(
              init: ManageServicesController(),
              builder: (ref) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PriceWidget(
                      isSelected: true,
                      validator: emptyFieldValidation,
                      onChanged: (p0) {
                        if (p0.isEmpty) {
                          ref.vendorCharge = 0.00;
                          ref.update();
                          return;
                        }
                        ref.vendorCharge =
                            (double.parse(p0) * 0.85).toPrecision(2);
                        ref.update();
                      },
                      controller: ref.chargeController,
                      color: AppColors.white,
                    ),
                    PriceWidget(
                      readOnly: true,
                      price: "${ref.vendorCharge}",
                      color: AppColors.white,
                      text: "You'll be Paid",
                    ),
                  ],
                );
              }),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/vendor_rates_widget.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/controllers/handyman_warranty_controller.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/components/price_widget.dart';

class HandymanWarantyMobileScreen extends StatelessWidget
    with FieldsValidation {
  const HandymanWarantyMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: GetBuilder<HandymanWarrantyController>(
          init: HandymanWarrantyController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    const CommonAppBar(
                      text: "Tell Us About Your Service",
                      hideBell: true,
                      headFontSize: 15,
                    ),
                    // ExpansionTile(
                    //     maintainState: true,
                    //     initiallyExpanded: true,
                    //     shape: Border.all(color: Colors.transparent, width: 0),
                    //     collapsedShape:
                    //         Border.all(color: Colors.transparent, width: 0),
                    //     tilePadding: EdgeInsets.zero,
                    //     childrenPadding: EdgeInsets.zero,
                    //     title: CommonTextRow(
                    //       text: "Service Warranty",
                    //       icon: RGIcons.suitcase1,
                    //       extraText: "(Check one)",
                    //     ),
                    //     children: [
                    //       const CommonText(
                    //         text: Strings.warrantyDisclamer,
                    //         fontSize: 11,
                    //         color: AppColors.grey,
                    //       ),
                    //       RadioTextWidget(
                    //         value: '1',
                    //         selectedValue: controller.selectedValue,
                    //         onChanged: (p0) {
                    //           controller.selectedValue = p0.toString();
                    //           controller.update();
                    //         },
                    //       ),
                    //       RadioTextWidget(
                    //         value: '2',
                    //         selectedValue: controller.selectedValue,
                    //         onChanged: (p0) {
                    //           controller.selectedValue = p0.toString();
                    //           controller.update();
                    //         },
                    //       ),
                    //       RadioTextWidget(
                    //         value: '3',
                    //         selectedValue: controller.selectedValue,
                    //         onChanged: (p0) {
                    //           controller.selectedValue = p0.toString();
                    //           controller.update();
                    //         },
                    //       ),
                    //     ]),
                    // const Divider(thickness: 1.5),
                    const VerticalSpacing(20),
                    VendorRatesWidget(
                      validator: emptyFieldValidation,
                      controller: controller.areaController,
                      ddList: controller.serviceNames,
                      onChanged: (value) {
                        controller.selectedServiceName = value;
                        controller.update();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PriceWidget(
                            isSelected: true,
                            validator: emptyFieldValidation,
                            onChanged: (p0) {
                              if (p0.isEmpty) {
                                controller.vendorCharge = 0.00;
                                controller.update();
                                return;
                              }
                              controller.vendorCharge =
                                  (double.parse(p0) * 0.85).toPrecision(2);
                              controller.update();
                            },
                            controller: controller.chargeController,
                            color: AppColors.white,
                          ),
                          PriceWidget(
                            readOnly: true,
                            price: "${controller.vendorCharge}",
                            color: AppColors.white,
                            text: "You'll be Paid",
                          ),
                        ],
                      ),
                    ),

                    const VerticalSpacing(60),
                    CommonTextButton(
                      onPressed: () {
                        if (controller.formkey.currentState!.validate()) {
                          controller.postHIService();
                        }
                      },
                      text: "SAVE",
                      color: AppColors.white,
                    ),
                    const VerticalSpacing(20),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

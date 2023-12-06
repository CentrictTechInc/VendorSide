import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/vendor_rates_widget.dart';
import 'package:vendor_app/presentation/screens/manage_services/controller/manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/components/price_widget.dart';

class ManageServicesMobileScreen extends StatelessWidget with FieldsValidation {
  ManageServicesMobileScreen({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        constraints: BoxConstraints(minHeight: context.height / 1.6),
        child: GetBuilder<ManageServicesController>(
            init: ManageServicesController(),
            builder: (controller) {
              return Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    CommonAppBar(
                      backButton: false,
                      hamburger: true,
                      editButton: !controller.isEdit,
                      onEdit: () {
                        controller.isEdit = true;
                        controller.update();
                      },
                      text: "Manage Services",
                      onDrawerPressed: onPressed,
                      hideBell: true,
                    ),
                    const VerticalSpacing(10),
                    VendorRatesWidget(
                      validator: emptyFieldValidation,
                      controller: controller.areaController,
                      selectedItem: controller.selectedServiceName,
                      editable: controller.isEdit,
                      ddList: controller.serviceNames,
                      onChanged: (value) {
                        controller.selectedServiceName = value;
                        controller.update();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PriceWidget(
                            isSelected: controller.isEdit,
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
                    const VerticalSpacing(30),
                    if (controller.isEdit)
                      CommonTextButton(
                        onPressed: () {
                          if (controller.formkey.currentState!.validate()) {
                            controller.updateHIService();
                          }
                        },
                        text: "SAVE",
                        color: AppColors.white,
                      ),
                    const VerticalSpacing(20),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

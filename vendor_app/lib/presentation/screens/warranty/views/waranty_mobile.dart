import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/presentation/screens/warranty/components/vendor_amenities.dart';
import 'package:vendor_app/presentation/screens/warranty/components/vendor_rates_widget.dart';
import 'package:vendor_app/presentation/screens/warranty/controllers/warranty_controller.dart';

class WarantyMobileScreen extends StatelessWidget with FieldsValidation {
  const WarantyMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: GetBuilder<WarrantyController>(
          init: WarrantyController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const CommonAppBar(
                    text: "Tell Us About Your Warranty",
                    hideBell: true,
                    headFontSize: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageIcon(AssetImage(RGIcons.suitcase1)),
                      const HorizontalSpacing(10),
                      CommonText(
                        text: "Service Warranty",
                        fontSize: 14,
                        weight: FontWeight.w600,
                      ),
                      const HorizontalSpacing(10),
                      CommonText(
                        text: "(Check one)",
                        fontSize: 10,
                        color: AppColors.grey,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            controller.warrantyInfo.toggle();
                          },
                          splashRadius: 10,
                          icon: Obx(() {
                            return Icon(
                              controller.warrantyInfo.value
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: AppColors.grey,
                            );
                          }))
                    ],
                  ),
                  Obx(() {
                    return Visibility(
                      visible: controller.warrantyInfo.value,
                      child: Column(
                        children: [
                          CommonText(
                            text: Strings.warrantyDisclamer,
                            fontSize: 11,
                            color: AppColors.grey,
                          ),
                          WarrantyDurationWIdget(),
                          WarrantyDurationWIdget(),
                          WarrantyDurationWIdget(),
                        ],
                      ),
                    );
                  }),
                  const Divider(thickness: 1.5),
                  const VerticalSpacing(20),
                  // VendorRatesWidget(),
                  VendorAmenities(),
                  const VerticalSpacing(60),
                  CommonTextButton(
                    onPressed: () {},
                    text: "SAVE",
                    color: AppColors.white,
                  ),
                  const VerticalSpacing(20),
                ],
              ),
            );
          }),
    );
  }
}

class WarrantyDurationWIdget extends StatelessWidget {
  const WarrantyDurationWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonText(
          text: "12 Months / 12,000 Miles",
          color: AppColors.grey,
          fontSize: 12,
        ),
        const Spacer(),
        Radio<String>(
          value: "1",
          groupValue: "2",
          activeColor: AppColors.grey,
          splashRadius: 20,
          fillColor: MaterialStateProperty.all(AppColors.grey),
          onChanged: (value) {},
        ),
        const HorizontalSpacing(5)
      ],
    );
  }
}

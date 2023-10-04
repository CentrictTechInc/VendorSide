import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/steps/automotive_service_pricing.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/steps/warranty_amenities_step.dart';

class AutomotiveWarantyMobileScreen extends StatelessWidget
    with FieldsValidation {
  const AutomotiveWarantyMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: GetBuilder<AutomotiveWarrantyController>(
          init: AutomotiveWarrantyController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CommonAppBar(
                    text: controller.steps == 1
                        ? "Tell Us About Your Warranty, Certifications, Training, Amenities"
                        : "Service Package Pricing",
                    hideBell: true,
                    headFontSize: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: controller.steps == 1,
                        replacement: CircleText(
                          number: "✔️",
                          highlighted: true,
                        ),
                        child: CircleText(
                          number: "1",
                          highlighted: true,
                        ),
                      ),
                      const HorizontalSpacing(5),
                      Container(
                        height: 1.5,
                        width: 50,
                        color: controller.steps == 2
                            ? AppColors.primary
                            : AppColors.grey,
                      ),
                      const HorizontalSpacing(5),
                      Visibility(
                        visible: controller.steps == 2,
                        child: CircleText(
                          number: "2",
                          highlighted: true,
                        ),
                        replacement: CircleText(
                          number: "2",
                        ),
                      ),
                    ],
                  ),
                  if (controller.steps == 1) AutomotiveWarrantyStep(),
                  if (controller.steps == 2) AutomotiveServicePricing(),
                  const VerticalSpacing(60),
                  CommonTextButton(
                    onPressed: () {
                      if (controller.steps == 1) {
                        controller.steps = 2;
                      } else {
                        controller.steps = 1;
                      }
                      controller.update();
                      print(controller.steps);
                    },
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

class CircleText extends StatelessWidget {
  CircleText({
    super.key,
    this.highlighted = false,
    required this.number,
  });
  String number;
  bool highlighted;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: highlighted ? AppColors.primary : AppColors.grey,
        ),
      ),
      child: Center(
        child: CommonText(
          textAlign: TextAlign.center,
          text: number,
          color: highlighted ? AppColors.primary : AppColors.grey,
          fontSize: 18,
        ),
      ),
    );
  }
}

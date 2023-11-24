import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/steps/automotive_service_pricing.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/steps/warranty_amenities_step.dart';

class AutomotiveWarantyMobileScreen extends StatelessWidget
    with FieldsValidation {
  AutomotiveWarantyMobileScreen({super.key});
  final cntrl = Get.find<ServiceController>();
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
                        replacement: const ImageIcon(
                          AssetImage(RGIcons.circleCheck),
                          size: 40,
                          color: AppColors.primary,
                        ),
                        child: CircleText(
                          number: "1",
                          highlighted: true,
                        ),
                      ),
                      if (controller.steps == 1) const HorizontalSpacing(5),
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
                        replacement: CircleText(
                          number: "2",
                        ),
                        child: CircleText(
                          number: "2",
                          highlighted: true,
                        ),
                      ),
                    ],
                  ),
                  if (controller.steps == 1) const AutomotiveWarrantyStep(),
                  if (controller.steps == 2) const AutomotiveServicePricing(),
                  const VerticalSpacing(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (controller.steps == 2)
                        CommonTextButton(
                          onPressed: () {
                            {
                              controller.steps = 1;
                              cntrl.getAllServices();
                            }
                            controller.update();
                          },
                          text: "BACK",
                          width: 30,
                          color: AppColors.white,
                        ),
                      if (controller.steps == 1 || controller.steps == 2)
                        CommonTextButton(
                          onPressed: () async {
                            if (controller.steps == 1) {
                              await controller.postWarrantyAndAmenitiesInfo();
                              controller.steps = 2;
                              cntrl.getAllServices();
                            } else if (context.mounted &&
                                controller.steps == 2) {
                              await cntrl.postServicePackagePricing();
                            }
                            controller.update();
                          },
                          text: "SAVE",
                          width: 30,
                          color: AppColors.white,
                        ),
                    ],
                  ),
                  const VerticalSpacing(20),
                ],
              ),
            );
          }),
    );
  }
}

// ignore: must_be_immutable
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

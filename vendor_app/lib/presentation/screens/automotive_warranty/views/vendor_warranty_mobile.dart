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
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/radio_text_widget.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/vendor_amenities.dart';

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
                  const CommonAppBar(
                    text:
                        "Tell Us About Your Warranty, Certifications, Training, Amenities",
                    hideBell: true,
                    headFontSize: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: controller.steps == 0,
                        replacement: CircleText(
                          number: "1",
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
                        color: controller.steps == 0
                            ? AppColors.primary
                            : AppColors.grey,
                      ),
                      const HorizontalSpacing(5),
                      Visibility(
                        visible: controller.steps == 1,
                        replacement: CircleText(
                          number: "2",
                          highlighted: true,
                        ),
                        child: CircleText(
                          number: "2",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ImageIcon(AssetImage(RGIcons.suitcase1)),
                      const HorizontalSpacing(10),
                      const CommonText(
                        text: "Service Warranty",
                        fontSize: 14,
                        weight: FontWeight.w600,
                      ),
                      const HorizontalSpacing(10),
                      const CommonText(
                        text: "(Check one)",
                        fontSize: 10,
                        color: AppColors.grey,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            controller.warrantyInfo.toggle();
                            controller.update();
                          },
                          splashRadius: 10,
                          icon: Icon(
                            controller.warrantyInfo.value
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: AppColors.grey,
                          )),
                    ],
                  ),
                  Visibility(
                    visible: controller.warrantyInfo.value,
                    child: Column(
                      children: [
                        const CommonText(
                          text: Strings.warrantyDisclamer,
                          fontSize: 11,
                          color: AppColors.grey,
                        ),
                        RadioTextWidget(
                          value: '1',
                          selectedValue: controller.selectedValue,
                          onChanged: (p0) {
                            controller.selectedValue = p0.toString();
                            controller.update();
                          },
                        ),
                        RadioTextWidget(
                          value: '2',
                          selectedValue: controller.selectedValue,
                          onChanged: (p0) {
                            controller.selectedValue = p0.toString();
                            controller.update();
                          },
                        ),
                        RadioTextWidget(
                          value: '3',
                          selectedValue: controller.selectedValue,
                          onChanged: (p0) {
                            controller.selectedValue = p0.toString();
                            controller.update();
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1.5),
                  const VerticalSpacing(20),
                  VendorAmenities(),
                  const VerticalSpacing(60),
                  CommonTextButton(
                    onPressed: () {
                      if (controller.steps == 0) {
                        controller.steps = 1;
                      } else {
                        controller.steps = 0;
                      }
                      controller.update();
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/vendor_amenities.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/radio_text_widget.dart';

class AutomotiveWarrantyStep extends StatelessWidget {
  const AutomotiveWarrantyStep({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AutomotiveWarrantyController>(
        init: AutomotiveWarrantyController(),
        builder: (controller) {
          return Column(
            children: [
              CommonTextRow(
                text: "Service Warranty",
                icon: RGIcons.suitcase1,
                extraText: "(Check one)",
                onPressed: () {
                  controller.warrantyInfo.toggle();
                  controller.update();
                },
                expanded: controller.warrantyInfo.value,
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
            ],
          );
        });
  }
}

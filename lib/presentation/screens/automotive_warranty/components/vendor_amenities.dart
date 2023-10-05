import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/radio_text_widget.dart';

class VendorAmenities extends StatelessWidget {
  VendorAmenities({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AutomotiveWarrantyController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  ImageIcon(AssetImage(RGIcons.workspacePremium)),
                  HorizontalSpacing(10),
                  CommonText(
                    text: "Automotive Certification and Training",
                    fontSize: 14,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              const VerticalSpacing(5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.bottomLeft,
                child: const CommonText(
                  text: "(Check all that apply)",
                  fontSize: 10,
                  color: AppColors.grey,
                ),
              ),
              const VerticalSpacing(15),
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {},
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: 75,
                      width: 80,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        children: [
                          ImageIcon(
                            AssetImage(RGIcons.upload),
                            color: AppColors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CommonText(
                            text: "Upload",
                            color: AppColors.white,
                            fontSize: 12,
                            weight: FontWeight.w400,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CommonTextRow(
                icon: RGIcons.hub,
                text: "Amenities",
                extraText: "(Check all that apply)",
                onPressed: () {
                  controller.warrantyInfo.toggle();
                  controller.update();
                },
                expanded: controller.warrantyInfo.value,
              ),
              Visibility(
                  visible: controller.warrantyInfo.value,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return RadioTextWidget(
                        isCheckBox: true,
                        isChanged: (p0) {
                          controller.isChecked[index] = p0!;
                          controller.update();
                        },
                        checkBoxvalue: controller.isChecked[index],
                        selectedValue: index.toString(),
                        text: "Autobody Services ${index.toString()}",
                        onChanged: (p0) {
                          controller.selectedValue = p0.toString();
                          controller.update();
                        },
                      );
                    },
                  ))
            ],
          );
        });
  }
}

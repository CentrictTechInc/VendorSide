import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
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
              ExpansionTile(
                  maintainState: true,
                  initiallyExpanded: true,
                  shape: Border.all(color: Colors.transparent, width: 0),
                  collapsedShape:
                      Border.all(color: Colors.transparent, width: 0),
                  title: CommonTextRow(
                    text: "Service Warranty",
                    icon: RGIcons.suitcase1,
                    extraText: "(Check one)",
                  ),
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.zero,
                  children: [
                    const CommonText(
                      text: Strings.warrantyDisclamer,
                      fontSize: 11,
                      color: AppColors.grey,
                    ),
                    RadioTextWidget(
                      value: controller.warrantyDuration[0],
                      text: controller.warrantyDuration[0],
                      selectedValue: controller.selectedValue,
                      onChanged: (p0) {
                        controller.selectedValue = p0.toString();
                        controller.update();
                      },
                    ),
                    RadioTextWidget(
                      value: controller.warrantyDuration[1],
                      selectedValue: controller.selectedValue,
                      text: controller.warrantyDuration[1],
                      onChanged: (p0) {
                        controller.selectedValue = p0.toString();
                        controller.update();
                      },
                    ),
                    RadioTextWidget(
                      value: controller.warrantyDuration[2],
                      selectedValue: controller.selectedValue,
                      text: controller.warrantyDuration[2],
                      onChanged: (p0) {
                        controller.selectedValue = p0.toString();
                        controller.update();
                      },
                    ),
                  ]),

              const Divider(thickness: 1.5),
              const VerticalSpacing(10),

              ///THIS IS THE AMENITIES WIDGET
              Column(
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
                  const VerticalSpacing(15),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(
                                  allowMultiple: true,
                                  withData: true,
                                  type: FileType.custom,
                                  allowedExtensions: ['png']);

                          if (result == null) {
                            ToastMessage.message('Please select png image.',
                                type: ToastType.warn);
                          } else {
                            controller.files = result.paths
                                .map((path) => File(path!))
                                .toList();
                            controller.update();
                          }
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            height: 75,
                            width: 80,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: controller.platformFile != null
                                    ? AppColors.blue
                                    : AppColors.grey,
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
                      const HorizontalSpacing(2),
                      if (controller.files != null)
                        SizedBox(
                          height: 80,
                          width: context.width * .7,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.files!.length,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Image.file(
                                controller.files![index],
                                // cacheHeight: 30,
                                height: 30,
                                width: 89,
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    maintainState: true,
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    collapsedShape:
                        Border.all(color: Colors.transparent, width: 0),
                    shape: Border.all(color: Colors.transparent, width: 0),
                    title: CommonTextRow(
                      icon: RGIcons.hub,
                      text: "Amenities",
                      extraText: "(Check all that apply)",
                    ),
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return const VerticalSpacing(5);
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.amenitiesList.length,
                        itemBuilder: (context, index) {
                          return RadioTextWidget(
                            isCheckBox: true,
                            isChanged: (p0) {
                              controller.isChecked[index] = p0!;
                              if (controller.isChecked[index]) {
                                controller.amenitiesCheckedList.addIf(
                                    !controller.amenitiesCheckedList.contains(
                                        controller.amenitiesList[index]),
                                    controller.amenitiesList[index]);
                              } else {
                                controller.amenitiesCheckedList
                                    .remove(controller.amenitiesList[index]);
                              }

                              controller.update();
                            },
                            checkBoxvalue: controller.isChecked[index],
                            selectedValue: index.toString(),
                            text: "${controller.amenitiesList[index]} ",
                            onChanged: (p0) {
                              controller.selectedValue = p0.toString();
                              controller.update();
                            },
                          );
                        },
                      )
                    ],
                  ),
                ],
              )
            ],
          );
        });
  }
}

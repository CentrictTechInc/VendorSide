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
                            print(controller.files!.length);
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
                      HorizontalSpacing(2),
                      if (controller.files != null)
                        Container(
                          height: 80,
                          width: context.width * .7,
                          child: ListView.builder(
                            padding: EdgeInsets.all(10),
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
                          return VerticalSpacing(5);
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.amenitiesList.length,
                        itemBuilder: (context, index) {
                          return RadioTextWidget(
                            isCheckBox: true,
                            isChanged: (p0) {
                              controller.isChecked[index] = p0!;
                              controller.update();
                            },
                            checkBoxvalue: controller.isChecked[index],
                            selectedValue: index.toString(),
                            text: "${controller.amenitiesList[index]}",
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

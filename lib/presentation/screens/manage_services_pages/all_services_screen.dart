import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/empty_list.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/presentation/screens/automotive_manage_services/controller/auto_manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/radio_text_widget.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/components/price_widget.dart';

class AllAmServicesScreen extends StatelessWidget with FieldsValidation {
  AllAmServicesScreen({super.key});
  final cntrl = Get.find<ManageAmServicesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.greyish),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cntrl.amList.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    ExpansionTile(
                      shape: Border.all(color: Colors.transparent, width: 0),
                      collapsedShape:
                          Border.all(color: Colors.transparent, width: 0),
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      title: CommonTextRow(
                        text: cntrl.amList[i].serviceName,
                        icon:
                            "${ServiceIcons.serviceIconUrl}service_${cntrl.amList[i].serviceId}.png",
                      ),
                      children: [
                        cntrl.amList[i].listSubServiceName.isEmpty
                            ? const EmptyListWidget(
                                title: "All Services Added!",
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    cntrl.amList[i].listSubServiceName.length,
                                itemBuilder: (context, index) {
                                  ListSubServiceName? subItem =
                                      cntrl.amList[i].listSubServiceName[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RadioTextWidget(
                                        isCheckBox: true,
                                        isChanged: cntrl.isEdit
                                            ? (p0) {
                                                subItem?.isSelected = p0;
                                                cntrl.update();
                                              }
                                            : (p0) {},
                                        checkBoxvalue:
                                            subItem!.isSelected ?? false,
                                        selectedValue:
                                            subItem.subServiceId.toString(),
                                        text:
                                            "${index + 1}. ${subItem.subServiceName}",
                                      ),
                                      const VerticalSpacing(10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          PriceWidget(
                                            isSelected:
                                                subItem.isSelected ?? false,
                                            validator: subItem.isSelected!
                                                ? emptyFieldValidation
                                                : (p0) {
                                                    return null;
                                                  },
                                            onChanged: (p0) {
                                              if (p0.isEmpty) {
                                                subItem.vendorCharge = 0;
                                                cntrl.update();
                                                return;
                                              }
                                              subItem.vendorCharge =
                                                  (double.parse(p0) * 0.85)
                                                      .toPrecision(2);

                                              cntrl.update();
                                            },
                                            controller: subItem.serviceCharges,
                                          ),
                                          PriceWidget(
                                            readOnly: true,
                                            price:
                                                "${subItem.vendorCharge ?? 0.00}",
                                            text: "You'll be Paid",
                                          ),
                                        ],
                                      ),
                                      const VerticalSpacing(15),
                                    ],
                                  );
                                },
                              ),
                      ],
                    ),
                    const VerticalSpacing(10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

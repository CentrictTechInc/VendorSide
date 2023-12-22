import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/empty_list.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/a_services_model.dart';
import 'package:vendor_app/presentation/screens/automotive_manage_services/controller/auto_manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/radio_text_widget.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/components/price_widget.dart';

class MyAmServicesScreen extends StatelessWidget with FieldsValidation {
  MyAmServicesScreen({
    super.key,
  });
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
            child: cntrl.groupedServiceList.isEmpty
                ? const EmptyListWidget(
                    title: "No Services Added Yet",
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: cntrl.groupedServiceList.length,
                    itemBuilder: (context, i) {
                      return ExpansionTile(
                        shape: Border.all(color: Colors.transparent, width: 0),
                        collapsedShape:
                            Border.all(color: Colors.transparent, width: 0),
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: EdgeInsets.zero,
                        title: CommonTextRow(
                          text: cntrl.groupedServiceList[i].serviceName ?? '',
                          icon:
                              "${ServiceIcons.serviceIconUrl}service_${cntrl.groupedServiceList[i].serviceId}.png",
                        ),
                        children: [
                          Column(
                            children: cntrl.groupedServiceList[i].services!
                                .map((subItem) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RadioTextWidget(
                                    isCheckBox: true,
                                    isChanged: cntrl.isEdit
                                        ? (p0) {
                                            subItem.isSelected = p0;
                                            cntrl.update();
                                          }
                                        : (p0) {},
                                    checkBoxvalue: subItem.isSelected ?? false,
                                    selectedValue:
                                        subItem.subServiceId.toString(),
                                    text:
                                        "${subItem.subServiceId.toString()}. ${subItem.subServiceName}",
                                  ),
                                  const VerticalSpacing(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      PriceWidget(
                                        isSelected: subItem.isSelected ?? false,
                                        validator: subItem.isSelected!
                                            ? emptyFieldValidation
                                            : (p0) {
                                                return null;
                                              },
                                        onChanged: (p0) {
                                          if (p0.isEmpty) {
                                            subItem.vendorPercentage = 0;
                                            cntrl.update();
                                            return;
                                          }
                                          subItem.vendorPercentage =
                                              (double.parse(p0) * 0.85)
                                                  .toPrecision(2);

                                          cntrl.update();
                                        },
                                        controller: subItem.serviceCharges,
                                      ),
                                      PriceWidget(
                                        readOnly: true,
                                        price:
                                            subItem.serviceCharges!.text.isEmpty
                                                ? "0"
                                                : (double.parse(subItem
                                                            .serviceCharges!
                                                            .text) *
                                                        0.85)
                                                    .toStringAsFixed(2),
                                        text: "You'll be Paid",
                                      ),
                                    ],
                                  ),
                                  const VerticalSpacing(15),
                                ],
                              );
                            }).toList(),
                          ),
                          const VerticalSpacing(15),
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

class ServiceList extends StatelessWidget {
  const ServiceList({required this.service, super.key});
  final AutoServicesModel service;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CommonText(text: service.serviceName, fontSize: 14),
        // CommonTextRow(
        //   text: service.serviceName,
        //   icon:
        //       "${ServiceIcons.serviceIconUrl}service_${service.serviceId}.png",
        // ),
        CommonTextRow(
          text: service.serviceName ?? '',
          icon:
              "${ServiceIcons.serviceIconUrl}service_${service.serviceId}.png",
        ),
        const VerticalSpacing(10),
      ],
    );
  }
}

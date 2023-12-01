import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/presentation/screens/automotive_manage_services/controller/auto_manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/radio_text_widget.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/components/price_widget.dart';

class AllAmServicesScreen extends StatelessWidget with FieldsValidation {
  const AllAmServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.greyish),
      child: SingleChildScrollView(
        child: GetBuilder<ManageAmServicesController>(
            init: ManageAmServicesController(),
            builder: (cntrl) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: AppColors.greyish),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cntrl.amList.length,
                      itemBuilder: (context, index) {
                        return ServiceList(
                          service: cntrl.amList[index],
                        );
                      },
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class ServiceList extends StatelessWidget {
  const ServiceList({required this.service, super.key});
  final ServicesModel service;
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
        ExpansionTile(
          maintainState: true,
          initiallyExpanded: false,
          shape: Border.all(color: Colors.transparent, width: 0),
          collapsedShape: Border.all(color: Colors.transparent, width: 0),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          title: CommonTextRow(
            text: service.serviceName,
            icon:
                "${ServiceIcons.serviceIconUrl}service_${service.serviceId}.png",
          ),
          children: [
            SizedBox(
              height: context.height * .9,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: service.listSubServiceName.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      RadioTextWidget(
                        isCheckBox: true,
                        isChanged: (p0) {
                          service.listSubServiceName[index]?.isSelected = p0;
                          // controller.update();
                        },
                        checkBoxvalue:
                            service.listSubServiceName[index]!.isSelected ??
                                false,
                        selectedValue: index.toString(),
                        text:
                            "${index + 1}. ${service.listSubServiceName[index]!.subServiceName}",
                      ),
                      const VerticalSpacing(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PriceWidget(
                            isSelected: service.isSelected ?? false,
                            // validator: service.isSelected!
                            //     ? emptyFieldValidation
                            //     : (p0) {
                            //         return null;
                            //       },
                            onChanged: (p0) {
                              if (p0.isEmpty) {
                                service.listSubServiceName[index]!
                                    .vendorCharge = 0.00;
                                // controller.update();
                                return;
                              }
                              // controller.servicePriceList.where((element) =>
                              // element.serviceId == service.serviceId

                              // );
                              // controller.servicePriceList =
                              //     controller.servicePriceList.map((element) {
                              //   if (element.subServiceId ==
                              //           service.listSubServiceName[index]!
                              //               .subServiceId
                              //       //  &&
                              //       // element.subServiceId == service.listSubServiceName[index]!.subServiceId

                              //       ) {
                              //     element.serviceCharges = (double.parse(p0))
                              //         .toPrecision(
                              //             2); // replace with the new value
                              //   }
                              //   return element;
                              // }).toList();

                              service.listSubServiceName[index]!.vendorCharge =
                                  (double.parse(p0) * 0.85).toPrecision(2);
                              // print(controller.servicePriceList.length);
                              // for (var i = 0;
                              //     i < controller.servicePriceList.length;
                              //     i++) {
                              // print(
                              //     controller.servicePriceList[i].toJson());
                              // }
                              // controller.update();
                            },
                            controller: service
                                .listSubServiceName[index]!.serviceCharges,
                            color: AppColors.whiteGreyish,
                          ),
                          PriceWidget(
                            readOnly: true,
                            price:
                                "${service.listSubServiceName[index]!.vendorCharge}",
                            color: AppColors.whiteGreyish,
                            text: "You'll be Paid",
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
        const VerticalSpacing(10),
      ],
    );
  }
}

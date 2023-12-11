import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/radio_text_widget.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/components/price_widget.dart';

class AutomotiveServicePricing extends StatelessWidget {
  const AutomotiveServicePricing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ServiceController(),
        builder: (controller) {
          return Column(
            children: [
              const VerticalSpacing(20),
              const CommonText(
                text: Strings.rgServicePricedisclamer,
                fontSize: 11,
                color: AppColors.grey,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.autoMotiveServiceList.length,
                itemBuilder: (context, index) {
                  return ServicePricingWidget(
                    service: controller.autoMotiveServiceList[index],
                  );
                },
              )
            ],
          );
        });
  }
}

// ignore: must_be_immutable
class ServicePricingWidget extends StatelessWidget with FieldsValidation {
  ServicePricingWidget({required this.service, super.key});
  final ServicesModel service;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceController>(
        init: ServiceController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    CommonTextRow(
                      text: service.serviceName,
                      icon:
                          "${ServiceIcons.serviceIconUrl}service_${service.serviceId}.png",
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 26,
                      child: Checkbox(
                        value: service.isSelected ?? false,
                        activeColor: AppColors.primary,
                        splashRadius: 20,
                        onChanged: (p0) {
                          service.isSelected = p0;
                          if (service.isSelected == true) {
                            controller.servicePriceList.addAll(
                              service.listSubServiceName
                                  .map(
                                    (e) => ServicePrice(
                                      serviceId: service.serviceId,
                                      vendorId: LocalStorageService
                                          .instance.user!.vid,
                                      serviceTypeId: 1,
                                      subServiceId: e!.subServiceId,
                                      subServiceName: e.subServiceName,
                                      serviceName: service.serviceName,
                                      registerDate: DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now()),
                                      serviceCharges: e.vendorCharge,
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            controller.servicePriceList.removeWhere((element) =>
                                element.serviceId == service.serviceId);
                          }

                          controller.update();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const CommonText(
                text: Strings.oilChnagePrice,
                fontSize: 11,
                color: AppColors.grey,
              ),
              const VerticalSpacing(20),
              if (service.isSelected == true)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: service.listSubServiceName.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioTextWidget(
                          isCheckBox: true,
                          isChanged: (p0) {
                            service.listSubServiceName[index]?.isSelected = p0;
                            controller.update();
                          },
                          checkBoxvalue:
                              service.listSubServiceName[index]!.isSelected ??
                                  false,
                          selectedValue: index.toString(),
                          text:
                              "${controller.alphabet[index]}. ${service.listSubServiceName[index]!.subServiceName}",
                        ),
                        const VerticalSpacing(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PriceWidget(
                              isSelected: service.isSelected ?? false,
                              validator: service.isSelected!
                                  ? emptyFieldValidation
                                  : (p0) {
                                      return null;
                                    },
                              onChanged: (p0) {
                                if (p0.isEmpty) {
                                  service.listSubServiceName[index]!
                                      .vendorCharge = 0.00;
                                  controller.update();
                                  return;
                                }

                                controller.servicePriceList =
                                    controller.servicePriceList.map((element) {
                                  if (element.subServiceId ==
                                      service.listSubServiceName[index]!
                                          .subServiceId) {
                                    element.serviceCharges = (double.parse(p0))
                                        .toPrecision(
                                            2); // replace with the new value
                                  }
                                  return element;
                                }).toList();

                                service.listSubServiceName[index]!
                                        .vendorCharge =
                                    (double.parse(p0) * 0.85).toPrecision(2);

                                controller.update();
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
                        ),
                        const VerticalSpacing(15),
                      ],
                    );
                  },
                ),
            ],
          );
        });
  }
}

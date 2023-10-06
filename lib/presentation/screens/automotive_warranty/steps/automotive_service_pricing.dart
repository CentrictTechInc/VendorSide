import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/controller/automotive_warranty_controller.dart';
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
class ServicePricingWidget extends StatelessWidget {
  ServicePricingWidget({required this.service, super.key});
  final ServicesModel service;
  double discountedCharge = 0;

  List<String> alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];
  final controller = Get.find<ServiceController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        CommonTextRow(
          text: service.serviceName,
          icon:
              "${ServiceIcons.serviceIconUrl}service_${service.serviceId}.png",
        ),
        const CommonText(
          text: Strings.oilChnagePrice,
          fontSize: 11,
          color: AppColors.grey,
        ),
        const VerticalSpacing(20),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: service.listSubServiceName.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonText(
                    text:
                        "${alphabet[index]}. ${service.listSubServiceName[index]!.subServiceName}",
                    fontSize: 12,
                  ),
                ),
                const VerticalSpacing(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceWidget(
                      onChanged: (p0) {
                        String? priceText = p0;

                        double charge = 0.0;

                        if (priceText != null) {
                          // Parse the price from the first PriceWidget
                          charge = double.tryParse(priceText) ?? 0.0;
                          print(priceText);
                        }

// Calculate 85% of the charge
                        discountedCharge = charge * 0.85;
                        // controller.update();
                        print(discountedCharge.obs);
                      },
                      controller:
                          service.listSubServiceName[index]!.serviceCharges,
                      color: AppColors.whiteGreyish,
                    ),
                    PriceWidget(
                      readOnly: true,
                      price: "${discountedCharge.obs}",
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
  }
}

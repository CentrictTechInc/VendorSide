import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_dropdown.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/a_servoces_model.dart';
import 'package:vendor_app/presentation/screens/automotive_manage_services/controller/auto_manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';
import 'package:vendor_app/presentation/screens/handyman_warranty/components/radio_text_widget.dart';
import 'package:vendor_app/presentation/screens/manage_services/controller/manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/manage_services_pages/all_services_screen.dart';
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cntrl.amVendorServiceList.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    CommonTextRow(
                      text: cntrl.amVendorServiceList[i].serviceName ?? '',
                      icon:
                          "${ServiceIcons.serviceIconUrl}service_${cntrl.amVendorServiceList[i].serviceId}.png",
                    ),
                    // Column(
                    //   children:
                    //       cntrl.amVendorServiceList[i].listSubServiceName.map((subItem) {
                    //     return CommonText(
                    //       text: subItem?.subServiceName ?? '',
                    //     );
                    //   }).toList(),
                    // )
                  ],
                );
              },
            ),
          )
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

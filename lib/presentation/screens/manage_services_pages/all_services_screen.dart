import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/presentation/screens/automotive_manage_services/controller/auto_manage_services_controller.dart';
import 'package:vendor_app/presentation/screens/automotive_warranty/components/common_text_icon_row.dart';

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
                    CommonTextRow(
                      text: cntrl.amList[i].serviceName,
                      icon:
                          "${ServiceIcons.serviceIconUrl}service_${cntrl.amList[i].serviceId}.png",
                    ),
                    Column(
                      children:
                          cntrl.amList[i].listSubServiceName.map((subItem) {
                        return CommonText(
                          text: subItem?.subServiceName ?? '',
                        );
                      }).toList(),
                    )
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

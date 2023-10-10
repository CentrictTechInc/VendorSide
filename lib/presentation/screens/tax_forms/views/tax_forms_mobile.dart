import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/upload_file.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/common/resources/page_path.dart';
import 'package:vendor_app/common/resources/strings.dart';
import 'package:vendor_app/presentation/screens/tax_forms/controller/tax_form_controller.dart';

// ignore: must_be_immutable
class TaxFormMobile extends StatelessWidget with FieldsValidation {
  PlatformFile? file;
  PlatformFile? file2;
  String? image;

  TaxFormMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primary,
          image: DecorationImage(
              image: AssetImage(Drawables.logoBackground),
              fit: BoxFit.fitWidth)),
      width: context.width,
      child: SingleChildScrollView(
          child: Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          VerticalSpacing(7.5.h),
          const CommonText(
            text: "Tax Number & Insurance",
            weight: FontWeight.w600,
            color: AppColors.white,
          ),
          VerticalSpacing(7.5.h),
          Container(
            // constraints: BoxConstraints(minHeight: context.height - 250),
            width: context.width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: GetBuilder<TaxFromController>(
                init: TaxFromController(),
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpacing(20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: CommonText(
                          text: Strings.signupCharges,
                          fontSize: 15,
                          textAlign: TextAlign.center,
                          color: AppColors.grey,
                        ),
                      ),
                      const VerticalSpacing(30),
                      Container(
                        width: 380,
                        decoration: BoxDecoration(
                            color: AppColors.greyish,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            const VerticalSpacing(15),
                            UploadButtonWithFile(
                              label: "upload",
                              topLabel: "EIN (W9 form)",
                              platformfile: file2,
                              onPress: () async {
                                // final c = Get.find<TaxFromController>();
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: ['png']);
                                file2 = result?.files.first;
                                controller.update();
                                // if (false) {
                                //   ToastMessage.message('Please select png image.');
                                // } else if (result != null) {

                                // }
                              },
                              onDeletePress: () {
                                // data.image = null;
                                file2 = null;
                                controller.update();
                              },
                            ),
                            const VerticalSpacing(40),
                            const CommonText(
                              text: "General Liability Insurance if (Company)",
                              textAlign: TextAlign.center,
                              weight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            const VerticalSpacing(10),
                            const CommonText(
                              text: "OR",
                              fontSize: 15,
                              color: AppColors.grey,
                            ),
                            const VerticalSpacing(10),
                            UploadButtonWithFile(
                              label: "upload",
                              platformfile: file,
                              topLabel:
                                  "Professional Liability Insurance if (Property)",
                              onPress: () async {
                                // final c = Get.find<TaxFromController>();
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: ['png']);
                                file = result?.files.first;
                                controller.update();
                                // if (false) {
                                //   ToastMessage.message('Please select png image.');
                                // } else if (result != null) {

                                // }
                              },
                              onDeletePress: () {
                                // data.image = null;
                                file = null;
                                controller.update();
                              },
                            ),
                            const VerticalSpacing(25),
                          ],
                        ),
                      ),
                      const VerticalSpacing(30),
                      Align(
                        alignment: Alignment.center,
                        child: CommonTextButton(
                            onPressed: () {
                              context.go(PagePath.automotiveService);
                            },
                            backgroundColor: AppColors.primary,
                            color: AppColors.background,
                            text: 'SAVE'),
                      ),
                      const VerticalSpacing(40),
                    ],
                  );
                }),
          ),
        ]),
      )),
    );
  }
}

import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/dashboard/controller/botton_nav_controller.dart';
import 'package:vendor_app/presentation/screens/dashboard/main_dashboard.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/components/tasks_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationBottomSheet with FieldsValidation {
  final controller = Get.find<BottomNavController>();
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  showNotification(
    String appiontmentId,
  ) {
    return showModalBottomSheet(
      context: globalScaffoldKey.currentContext!,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: AppColors.grey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              // height: 500,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grey.withOpacity(0.2), blurRadius: 5.0),
                ],
              ),
              child: FutureBuilder(
                  future: controller.getAutoAppointments(appiontmentId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 500,
                        child: Center(
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator())),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        children: [
                          const VerticalSpacing(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.grey,
                                  )),
                              CommonText(
                                text: "Appointment Details $appiontmentId",
                                fontSize: 12.sp,
                                weight: FontWeight.w600,
                                color: AppColors.primaryText,
                              ),
                              IconButton(
                                  onPressed: () {
                                    // Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: AppColors.grey,
                                  )),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: TasksCard(
                              isgrey: true,
                              type: "Completed:",
                              task: controller.tasks!,
                              icon: Icons.alarm,
                            ),
                          ),
                          const VerticalSpacing(20),
                          const CommonText(
                            text: "Your Offer",
                            fontSize: 20,
                          ),
                          SizedBox(
                            width: context.width - 70,
                            child: CommonTextField(
                              hintText: "Estimated Cost: \$50.00",
                              controller: controller.priceController,
                              validator: emptyFieldValidation,
                              inputType: TextInputType.phone,
                            ),
                          ),
                          const VerticalSpacing(20),
                          CommonTextButton(
                              onPressed: () {
                                if (controller
                                    .priceController.text.isNotEmpty) {
                                  controller.postBidding(appiontmentId);
                                  context.pop();
                                  print("object");
                                }
                              },
                              color: AppColors.white,
                              width: 60,
                              text: "Place Offer"),
                          const VerticalSpacing(20),
                        ],
                      );
                    }
                  }),
            ),
          ),
        );
      },
    );
  }
}

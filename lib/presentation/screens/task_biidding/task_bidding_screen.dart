import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/mixins/validations.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/app/utils/common_text_field.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/task_biidding/controller/task_bidding_controller.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/components/tasks_card.dart';

class TaskBiddingScreen extends StatelessWidget with FieldsValidation {
  const TaskBiddingScreen({required this.appiontmentId, super.key});
  final String appiontmentId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
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
          child: GetBuilder<TaskBiddingController>(
              init: TaskBiddingController(appiontmentId),
              builder: (controller) {
                if (controller.tasks == null) {
                  return const SizedBox(
                    height: 500,
                    child: Center(
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator())),
                  );
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
                            text: "Appointment Details",
                            fontSize: 12.sp,
                            weight: FontWeight.w600,
                            color: AppColors.primaryText,
                          ),
                          const SizedBox(
                            width: 50,
                          ),
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
                            if (controller.priceController.text.isNotEmpty) {
                              controller.postBidding(appiontmentId);
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
  }
}

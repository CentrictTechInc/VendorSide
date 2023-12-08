import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/components/tasks_card.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({required this.tasks, super.key});
  final TasksStatusResponseModel tasks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const CommonAppBar(
                backButton: true,
                hamburger: false,
                text: "Task Info",
                hideBell: true,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.whiteGreyish),
                child: Column(
                  children: [
                    TasksCard(
                      type: "Completed:",
                      task: tasks,
                      icon: Icons.alarm,
                      isPending: true,
                    ),
                    const VerticalSpacing(10),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.grey.withOpacity(0.2),
                                blurRadius: 2.0),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const HorizontalSpacing(5),
                                const ImageIcon(
                                  AssetImage(RGIcons.fancyCar),
                                  color: AppColors.primaryText,
                                  size: 25,
                                ),
                                const HorizontalSpacing(5),
                                CommonText(
                                  text: "Vehicle",
                                  fontSize: 11.sp,
                                  weight: FontWeight.w600,
                                  color: AppColors.primaryText,
                                ),
                              ],
                            ),
                            const VerticalSpacing(10),
                            CommonText(
                              text:
                                  "${tasks.vehicleYear} ${tasks.vehicleMake} ${tasks.vehicleModel}",
                              fontSize: 16,
                              weight: FontWeight.w600,
                            ),
                          ],
                        )),
                    const VerticalSpacing(10),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.grey.withOpacity(0.2),
                                blurRadius: 2.0),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage(RGIcons.note),
                                  color: AppColors.primaryText,
                                  size: 20,
                                ),
                                const HorizontalSpacing(10),
                                CommonText(
                                  text: "Note from customer :",
                                  fontSize: 10.5.sp,
                                  weight: FontWeight.w500,
                                  color: AppColors.primaryText,
                                ),
                              ],
                            ),
                            const VerticalSpacing(10),
                            const CommonText(
                              text:
                                  "Along with the tire service, please inspect the brakes for any necessary repairs. Additionally, I'd like to request lug nut covers for all the wheels. and I'd like to request lug nut covers for all the wheels. and readmore",
                              fontSize: 10,
                              lineHeight: 1.4,
                              weight: FontWeight.w500,
                            ),
                          ],
                        )),
                    const VerticalSpacing(10),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.grey.withOpacity(0.2),
                                blurRadius: 2.0),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage(RGIcons.estimatedPrice),
                                  color: AppColors.primaryText,
                                  size: 20,
                                ),
                                const HorizontalSpacing(5),
                                CommonText(
                                  text: "Estimate Price Details",
                                  fontSize: 10.sp,
                                  weight: FontWeight.w500,
                                  color: AppColors.primaryText,
                                ),
                              ],
                            ),
                            const VerticalSpacing(10),
                            Row(
                              children: [
                                const CommonText(
                                  text: "Price",
                                  fontSize: 16,
                                  weight: FontWeight.w500,
                                ),
                                const Spacer(),
                                CommonText(
                                  text: "\$${tasks.price}",
                                  fontSize: 16,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const VerticalSpacing(10),
                            const Row(
                              children: [
                                CommonText(
                                  text: "Guru Share",
                                  fontSize: 16,
                                  weight: FontWeight.w500,
                                ),
                                Spacer(),
                                CommonText(
                                  text: "15%",
                                  fontSize: 16,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const VerticalSpacing(10),
                            Row(
                              children: [
                                const CommonText(
                                  text: "Amount Payable",
                                  fontSize: 16,
                                  weight: FontWeight.w500,
                                ),
                                const Spacer(),
                                CommonText(
                                  text:
                                      "\$${(double.parse(tasks.price!) * .85).toStringAsPrecision(2)}",
                                  fontSize: 16,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

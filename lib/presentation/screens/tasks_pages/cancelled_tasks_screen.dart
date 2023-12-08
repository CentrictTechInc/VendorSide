import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/empty_list.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/tasks/controller/tasks_controller.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/components/past_tasks_card.dart';

// ignore: must_be_immutable
class CancelledTasksScreen extends StatelessWidget {
  CancelledTasksScreen({
    super.key,
  });
  String dropdownvalue = 'Item 1';

  final cntrl = Get.find<TasksController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: context.height - 500),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.whiteGreyish),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: FutureBuilder(
          future: cntrl.getTasks(status: 'cancelled'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else {
              if (cntrl.tasksList.isNotEmpty) {
                return Column(
                  children: [
                    const VerticalSpacing(15),
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const VerticalSpacing(10.0);
                          },
                          shrinkWrap: true,
                          itemCount: cntrl.tasksList.length,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          itemBuilder: (builder, index) {
                            return PastTasksCard();
                          }),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: EmptyListWidget(
                    title: "No Reocrds Found",
                  ),
                );
              }
            }
          }),
    );
  }
}

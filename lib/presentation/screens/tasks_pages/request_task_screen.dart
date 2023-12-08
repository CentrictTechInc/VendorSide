import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/empty_list.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/tasks/controller/tasks_controller.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/components/tasks_card.dart';

// ignore: must_be_immutable
class RequestsTaskScreen extends StatelessWidget {
  RequestsTaskScreen({
    super.key,
  });
  final cntrl = Get.find<TasksController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.whiteGreyish),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: FutureBuilder(
          future: cntrl.getTasks(status: 'request'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else {
              return cntrl.tasksList.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) {
                        return const VerticalSpacing(10.0);
                      },
                      itemCount: cntrl.tasksList.length,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 0),
                      itemBuilder: (builder, index) {
                        return TasksCard(
                          type: cntrl.tasksList[index].status!,
                          task: cntrl.tasksList[index],
                          icon: Icons.alarm,
                        );
                      })
                  : const Center(
                      child: EmptyListWidget(
                        title: "No Reocrds Found",
                      ),
                    );
            }
          }),
    );
  }
}

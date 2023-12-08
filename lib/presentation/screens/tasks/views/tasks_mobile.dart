import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/tasks/components/tab_button.dart';
import 'package:vendor_app/presentation/screens/tasks/controller/tasks_controller.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/cancelled_tasks_screen.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/current_task_screen.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/past_task_screen.dart';
import 'package:vendor_app/presentation/screens/tasks_pages/request_task_screen.dart';

class TasksMobileScreen extends StatelessWidget {
  TasksMobileScreen({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GetBuilder<TasksController>(
          init: TasksController(),
          builder: (controller) {
            return Column(
              children: [
                CommonAppBar(
                  backButton: false,
                  hamburger: true,
                  text: "Tasks",
                  onDrawerPressed: onPressed,
                  hideBell: true,
                ),
                const VerticalSpacing(10),
                Container(
                    width: context.width,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.whiteGreyish),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TabButton(
                                name: "Requests",
                                fontSize: 11,
                                highlighted: controller.tabIndex == 0,
                                onPressed: () => controller.changeIndex(0),
                              ),
                            ),
                            Expanded(
                              child: TabButton(
                                name: "Current",
                                fontSize: 11,
                                highlighted: controller.tabIndex == 1,
                                onPressed: () => controller.changeIndex(1),
                              ),
                            ),
                            Expanded(
                              child: TabButton(
                                name: "Past",
                                fontSize: 11,
                                highlighted: controller.tabIndex == 2,
                                onPressed: () => controller.changeIndex(2),
                              ),
                            ),
                            Expanded(
                              child: TabButton(
                                name: "Cancelled",
                                fontSize: 10,
                                highlighted: controller.tabIndex == 3,
                                onPressed: () => controller.changeIndex(3),
                              ),
                            ),
                          ],
                        ))),
                const VerticalSpacing(5),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (value) {},
                    children: [
                      RequestsTaskScreen(),
                      CurrentTasks(),
                      PastTasksScreen(),
                      CancelledTasksScreen(),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

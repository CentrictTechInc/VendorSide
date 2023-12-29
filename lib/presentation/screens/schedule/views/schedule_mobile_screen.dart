import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/schedule/components/time_container.dart';
import 'package:vendor_app/presentation/screens/schedule/controllers/task_schedule_controller.dart';
import 'package:vendor_app/presentation/screens/tasks/components/tab_button.dart';

class ScheduleMobileScreen extends StatelessWidget {
  const ScheduleMobileScreen({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<TaskScheduleController>(
            init: TaskScheduleController(),
            builder: (controller) {
              final headerText =
                  DateFormat.yMMM().format(controller.focusedDay.value);

              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonAppBar(
                        backButton: false,
                        hamburger: true,
                        text: controller.canEdit ? "Edit Schedule" : "Schedule",
                        onDrawerPressed: onPressed,
                        hideBell: true,
                        editButton: !controller.canEdit,
                        onEdit: () {
                          controller.canEdit = true;
                          controller.update();
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CommonText(
                          text: controller.canEdit
                              ? "Current Dates"
                              : "Selected Dates",
                          fontSize: 14,
                          weight: FontWeight.w600,
                        ),
                      ),
                      const VerticalSpacing(10),
                      Center(
                        child: CommonText(
                          text: headerText,
                          fontSize: 14,
                        ),
                      ),
                      const VerticalSpacing(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          'Sun',
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                        ].map((day) => Text(day)).toList(),
                      ),
                      const VerticalSpacing(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.daysOfWeek.entries.map((entry) {
                          List<DateTime> dates = entry.value;
                          return Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: dates.map((date) {
                                bool isCurrentMonth = date.month ==
                                        controller.focusedDay.value.month &&
                                    date.year ==
                                        controller.focusedDay.value.year;
                                bool isSameDay1(
                                    DateTime date1, DateTime date2) {
                                  return date1.day == date2.day &&
                                      date1.month == date2.month &&
                                      date1.year == date2.year;
                                }

                                return InkWell(
                                  splashColor: Colors.white,
                                  highlightColor: Colors.transparent,
                                  onTap: controller.canEdit && isCurrentMonth
                                      ? () {
                                          if (controller.selectedDates
                                              .contains(date)) {
                                            controller.selectedDates
                                                .remove(date);
                                            controller.update();
                                          } else {
                                            // Otherwise, select it
                                            controller.selectedDates.add(date);

                                            controller.update();
                                          }
                                        }
                                      : null,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 5, right: 5, top: 5),
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: controller.selectedDates
                                                  .contains(date) &&
                                              isCurrentMonth
                                          ? AppColors.white
                                          : isSameDay1(
                                                  controller.focusedDay.value,
                                                  date)
                                              ? AppColors.primary
                                              : !isCurrentMonth
                                                  ? AppColors.white
                                                  : AppColors.primaryLight,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: CommonText(
                                          textAlign: TextAlign.center,
                                          weight: FontWeight.bold,
                                          fontSize: 14,
                                          text: DateFormat('d').format(date),
                                          color: controller.selectedDates
                                                  .contains(date)
                                              ? AppColors.grey
                                              : isSameDay1(
                                                      controller
                                                          .focusedDay.value,
                                                      date)
                                                  ? AppColors.white
                                                  : !isCurrentMonth
                                                      ? AppColors.grey
                                                      : AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }).toList(),
                      ),
                      const VerticalSpacing(20),
                      const Divider(
                        thickness: 1,
                      ),
                      const VerticalSpacing(10),
                      Center(
                        child: CommonText(
                          text: controller.canEdit
                              ? "Select Time"
                              : "Current Time",
                          fontSize: 14,
                          weight: FontWeight.w600,
                        ),
                      ),
                      const VerticalSpacing(10),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0, bottom: 10),
                        child: CommonText(
                          text: "Start",
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TimeContainer(
                            canEdit: controller.canEdit,
                            onUpPressed: () {
                              controller.getStartTime = controller
                                  .incrementTime(controller.getStartTime);
                              controller.update();
                            },
                            onDownPressed: () {
                              controller.getStartTime = controller
                                  .decrementTime(controller.getStartTime);
                              controller.update();
                            },
                            timeText: controller.getStartTime,
                          ),
                          Container(
                              constraints: const BoxConstraints(maxWidth: 160),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: AppColors.greyish),
                              child: Obx(() {
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TabButton(
                                        color: AppColors.primary,
                                        name: "AM",
                                        padding: 0,
                                        height: 44,
                                        radius: 14,
                                        highlighted:
                                            controller.timeStartFormat.value,
                                        onPressed: controller.canEdit
                                            ? () => controller.timeStartFormat
                                                .toggle()
                                            : null,
                                      ),
                                    ),
                                    Expanded(
                                      child: TabButton(
                                        color: AppColors.primary,
                                        padding: 0,
                                        name: "PM",
                                        height: 44,
                                        radius: 14,
                                        highlighted:
                                            !controller.timeStartFormat.value,
                                        onPressed: controller.canEdit
                                            ? () {
                                                controller.timeStartFormat
                                                    .toggle();
                                              }
                                            : null,
                                      ),
                                    ),
                                  ],
                                );
                              }))
                        ],
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 12.0, bottom: 10, top: 15),
                        child: CommonText(
                          text: "End",
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TimeContainer(
                            canEdit: controller.canEdit,
                            onUpPressed: () {
                              controller.getEndTime = controller
                                  .incrementTime(controller.getEndTime);
                              controller.update();
                            },
                            onDownPressed: () {
                              controller.getEndTime = controller
                                  .decrementTime(controller.getEndTime);
                              controller.update();
                            },
                            timeText: controller.getEndTime,
                          ),
                          Container(
                              constraints: const BoxConstraints(maxWidth: 160),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: AppColors.greyish),
                              child: Obx(() {
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TabButton(
                                        color: AppColors.primary,
                                        name: "AM",
                                        padding: 0,
                                        height: 44,
                                        radius: 14,
                                        highlighted:
                                            controller.timeEndFormat.value,
                                        onPressed: controller.canEdit
                                            ? () => controller.timeEndFormat
                                                .toggle()
                                            : null,
                                      ),
                                    ),
                                    Expanded(
                                      child: TabButton(
                                        color: AppColors.primary,
                                        padding: 0,
                                        name: "PM",
                                        height: 44,
                                        radius: 14,
                                        highlighted:
                                            !controller.timeEndFormat.value,
                                        onPressed: controller.canEdit
                                            ? () {
                                                controller.timeEndFormat
                                                    .toggle();
                                              }
                                            : null,
                                      ),
                                    ),
                                  ],
                                );
                              }))
                        ],
                      ),
                      const VerticalSpacing(20),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TabButton(
                              color: AppColors.primary,
                              name: "Central",
                              height: 44,
                              radius: 14,
                              highlighted: controller.timeStandard == 0,
                              onPressed: controller.canEdit
                                  ? () => controller.changetime(0)
                                  : null,
                            ),
                          ),
                          Expanded(
                            child: TabButton(
                              color: AppColors.primary,
                              name: "Eastern",
                              height: 44,
                              radius: 14,
                              highlighted: controller.timeStandard == 1,
                              onPressed: controller.canEdit
                                  ? () {
                                      controller.changetime(1);
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpacing(20),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TabButton(
                              color: AppColors.primary,
                              name: "Mountain",
                              height: 44,
                              radius: 14,
                              highlighted: controller.timeStandard == 2,
                              onPressed: controller.canEdit
                                  ? () => controller.changetime(2)
                                  : null,
                            ),
                          ),
                          Expanded(
                            child: TabButton(
                              color: AppColors.primary,
                              name: "Pacific",
                              height: 44,
                              radius: 14,
                              highlighted: controller.timeStandard == 3,
                              onPressed: controller.canEdit
                                  ? () {
                                      controller.changetime(3);
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: controller.canEdit,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                          ),
                          child: CommonTextButton(
                            onPressed: () {
                              controller.updateSchedule();
                            },
                            text: "SAVE",
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const VerticalSpacing(30),
                    ]),
              );
            }));
  }
}

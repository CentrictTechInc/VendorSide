import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/app/utils/common_text_button.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/presentation/screens/schedule/controllers/task_schedule_controller.dart';
import 'package:vendor_app/presentation/screens/tasks/components/tab_button.dart';

// ignore: must_be_immutable
class ScheduleMobileScreen extends StatelessWidget {
  ScheduleMobileScreen({this.onPressed, super.key});

  late PageController _pageController;
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
                      const VerticalSpacing(10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     IconButton(
                      //       icon: const Icon(
                      //         Icons.chevron_left,
                      //         size: 30,
                      //         color: AppColors.grey,
                      //       ),
                      //       onPressed: () {
                      //         _pageController.previousPage(
                      //           duration: const Duration(milliseconds: 300),
                      //           curve: Curves.easeOut,
                      //         );
                      //       },
                      //     ),
                      //     const HorizontalSpacing(50),
                      //     CommonText(
                      //       text: headerText,
                      //       fontSize: 14,
                      //     ),
                      //     const HorizontalSpacing(50),
                      //     IconButton(
                      //       icon: const Icon(
                      //         Icons.chevron_right,
                      //         size: 30,
                      //         color: AppColors.grey,
                      //       ),
                      //       onPressed: () {
                      //         _pageController.nextPage(
                      //           duration: const Duration(milliseconds: 300),
                      //           curve: Curves.easeOut,
                      //         );
                      //       },
                      //     ),
                      //   ],
                      // ),
                      const VerticalSpacing(20),
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
                                            print(controller.selectedDates);
                                            controller.update();
                                          } else {
                                            // Otherwise, select it
                                            controller.selectedDates.add(date);

                                            controller.update();
                                          }
                                        }
                                      : null,
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 40, minHeight: 45),
                                    margin: const EdgeInsets.only(
                                        bottom: 5, right: 5, top: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: controller.selectedDates
                                                  .contains(date) &&
                                              isCurrentMonth
                                          ? AppColors.white
                                          : isSameDay1(
                                                  controller.focusedDay.value,
                                                  date)
                                              ? AppColors.primary
                                              : AppColors.primaryLight,
                                    ),
                                    alignment: Alignment.center,
                                    // padding: const EdgeInsets.symmetric(
                                    //     vertical: 15.0, horizontal: 10),
                                    child: CommonText(
                                      textAlign: TextAlign.center,
                                      weight: FontWeight.bold,
                                      fontSize: 14,
                                      text: DateFormat('d').format(date),
                                      color: controller.selectedDates
                                              .contains(date)
                                          ? AppColors.grey
                                          : isSameDay1(
                                                  controller.focusedDay.value,
                                                  date)
                                              ? AppColors.white
                                              : AppColors.primary,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }).toList(),
                      ),
                      const VerticalSpacing(20),
                      // TableCalendar(
                      //   focusedDay: controller.focusedDay.value,
                      //   calendarFormat: CalendarFormat.month,
                      //   rowHeight: 50,
                      //   headerVisible: false,
                      //   availableGestures: AvailableGestures.all,
                      //   // weekNumbersVisible: true,
                      //   onCalendarCreated: (controller) =>
                      //       _pageController = controller,
                      //   onPageChanged: (focusedDay) =>
                      //       controller.focusedDay.value = focusedDay,
                      //   firstDay: DateTime(DateTime.now().year - 1),
                      //   lastDay: DateTime(DateTime.now().year + 1),
                      //   // focusedDay: stringToDateTime(data.appointmentDate ?? "")!,
                      //   calendarStyle: CalendarStyle(
                      //       selectedDecoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(70),
                      //           border: Border.all(
                      //             color: AppColors.primary,
                      //             width: 1.5,
                      //           )),
                      //       selectedTextStyle: const TextStyle(
                      //           color: AppColors.primary,
                      //           fontWeight: FontWeight.bold),
                      //       isTodayHighlighted: false,
                      //       weekendTextStyle:
                      //           const TextStyle(color: AppColors.primaryText)),

                      //   // selectedDayPredicate: (day) {
                      //   //   return isSameDay1(
                      //   //       stringToDateTime(data.appointmentDate ?? ''), day);
                      //   // },
                      //   currentDay: DateTime.now(),
                      // ),
                      // const VerticalSpacing(10),
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
                          Container(
                            constraints: const BoxConstraints(maxWidth: 160),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.greyish,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: controller.canEdit
                                        ? () {
                                            controller.decrementStartTime();
                                          }
                                        : null,
                                  ),
                                ),
                                const HorizontalSpacing(10),
                                Expanded(child: Obx(() {
                                  return CommonText(
                                    text: controller.getStartTime.value,
                                    fontSize: 9.sp,
                                  );
                                })),
                                const HorizontalSpacing(10),
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_up,
                                      size: 20,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: controller.canEdit
                                        ? () {
                                            controller.incrementStartTime();
                                          }
                                        : null,
                                  ),
                                ),
                              ],
                            ),
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
                          Container(
                            constraints: const BoxConstraints(maxWidth: 160),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.greyish,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: controller.canEdit
                                        ? () {
                                            controller.decrementEndTime();
                                          }
                                        : null,
                                  ),
                                ),
                                const HorizontalSpacing(10),
                                Expanded(child: Obx(() {
                                  return CommonText(
                                    text: controller.getEndTime.value,
                                    fontSize: 9.sp,
                                  );
                                })),
                                const HorizontalSpacing(10),
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_up,
                                      size: 20,
                                      color: AppColors.grey,
                                    ),
                                    onPressed: controller.canEdit
                                        ? () {
                                            controller.incrementEndTime();
                                          }
                                        : null,
                                  ),
                                ),
                              ],
                            ),
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

class TimeGridChild extends StatelessWidget {
  const TimeGridChild({
    super.key,
    required this.time,
    required this.selected,
    required this.onTap,
  });

  final String time;
  final bool selected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: selected,
      replacement: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondary),
        child: Center(
          child: CommonText(
            text: time,
            fontSize: 10.sp,
            color: AppColors.white,
          ),
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.greyish,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: CommonText(
              text: time,
              fontSize: 10.sp,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

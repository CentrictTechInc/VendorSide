import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class ScheduleMobileScreen extends StatelessWidget {
  ScheduleMobileScreen({this.onPressed, super.key});

  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  late PageController _pageController;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(_focusedDay.value);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<TaskScheduleController>(
            init: TaskScheduleController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonAppBar(
                        backButton: false,
                        hamburger: true,
                        text: "Add Schedule",
                        onDrawerPressed: onPressed,
                        hideBell: true,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: const CommonText(
                          text: "Select Date",
                          fontSize: 14,
                          weight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                              size: 30,
                              color: AppColors.grey,
                            ),
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            },
                          ),
                          const HorizontalSpacing(50),
                          CommonText(
                            text: headerText,
                            fontSize: 14,
                          ),
                          const HorizontalSpacing(50),
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_right,
                              size: 30,
                              color: AppColors.grey,
                            ),
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            },
                          ),
                        ],
                      ),
                      const VerticalSpacing(20),
                      TableCalendar(
                        focusedDay: _focusedDay.value,
                        calendarFormat: CalendarFormat.month,
                        rowHeight: 50,
                        headerVisible: false,
                        availableGestures: AvailableGestures.all,
                        // weekNumbersVisible: true,
                        onCalendarCreated: (controller) =>
                            _pageController = controller,
                        onPageChanged: (focusedDay) =>
                            _focusedDay.value = focusedDay,
                        firstDay: DateTime(DateTime.now().year - 1),
                        lastDay: DateTime(DateTime.now().year + 1),
                        // focusedDay: stringToDateTime(data.appointmentDate ?? "")!,
                        calendarStyle: CalendarStyle(
                            selectedDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 1.5,
                                )),
                            selectedTextStyle: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold),
                            isTodayHighlighted: false,
                            weekendTextStyle:
                                const TextStyle(color: AppColors.primaryText)),

                        // selectedDayPredicate: (day) {
                        //   return isSameDay(
                        //       stringToDateTime(data.appointmentDate ?? ''), day);
                        // },
                        currentDay: DateTime.now(),
                      ),
                      const VerticalSpacing(10),
                      const Divider(
                        thickness: 1,
                      ),
                      const VerticalSpacing(10),
                      const Center(
                        child: CommonText(
                          text: "Select Time",
                          fontSize: 14,
                          weight: FontWeight.w600,
                        ),
                      ),
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
                                    onPressed: () {
                                      controller.decrementStartTime();
                                    },
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
                                    onPressed: () {
                                      controller.incrementStartTime();
                                    },
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
                                        onPressed: () =>
                                            controller.timeStartFormat.toggle(),
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
                                        onPressed: () {
                                          controller.timeStartFormat.toggle();
                                        },
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
                                    onPressed: () {
                                      controller.decrementEndTime();
                                    },
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
                                    onPressed: () {
                                      controller.incrementEndTime();
                                    },
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
                                        onPressed: () =>
                                            controller.timeEndFormat.toggle(),
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
                                        onPressed: () {
                                          controller.timeEndFormat.toggle();
                                        },
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
                              onPressed: () => controller.changetime(0),
                            ),
                          ),
                          Expanded(
                            child: TabButton(
                              name: "Eastern",
                              height: 44,
                              radius: 14,
                              highlighted: controller.timeStandard == 1,
                              onPressed: () {
                                controller.changetime(1);
                              },
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
                              onPressed: () => controller.changetime(2),
                            ),
                          ),
                          Expanded(
                            child: TabButton(
                              name: "Pacific",
                              height: 44,
                              radius: 14,
                              highlighted: controller.timeStandard == 3,
                              onPressed: () {
                                controller.changetime(3);
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                        ),
                        child: CommonTextButton(
                          onPressed: () {
                            ToastMessage.message(
                                "Your Schedule Has Been Updated Successfully",
                                type: ToastType.success);
                          },
                          text: "SAVE",
                          color: AppColors.white,
                        ),
                      )
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

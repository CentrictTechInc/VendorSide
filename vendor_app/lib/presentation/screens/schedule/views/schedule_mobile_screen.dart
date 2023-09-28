import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vendor_app/app/utils/common_appbar.dart';
import 'package:vendor_app/app/utils/common_spacing.dart';
import 'package:vendor_app/app/utils/common_text.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/presentation/screens/schedule/views/test.dart';

class ScheduleMobileScreen extends StatelessWidget {
  ScheduleMobileScreen({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          CommonAppBar(
            backButton: false,
            hamburger: true,
            text: "Add Schedule",
            onDrawerPressed: onPressed,
            hideBell: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: AppColors.grey,
                ),
                onPressed: () {},
              ),
              const HorizontalSpacing(50),
              CommonText(
                text: "April",
                fontSize: 14,
              ),
              const HorizontalSpacing(50),
              IconButton(
                icon: Icon(
                  Icons.chevron_right,
                  size: 30,
                  color: AppColors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const VerticalSpacing(20),
          TableCalendar(
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            rowHeight: 50,
            headerVisible: false,
            // availableGestures: AvailableGestures.all,
            // weekNumbersVisible: true,
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
                    color: AppColors.primary, fontWeight: FontWeight.bold),
                isTodayHighlighted: false,
                weekendTextStyle:
                    const TextStyle(color: AppColors.primaryText)),
            // selectedDayPredicate: (day) {
            //   return isSameDay(
            //       stringToDateTime(data.appointmentDate ?? ''), day);
            // },
            currentDay: DateTime.now(),
          ),
          // Expanded(child: TableComplexExample()),
          // SizedBox(
          //   height: 165,
          //   child: GridView.builder(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 3,
          //         crossAxisSpacing: 15,
          //         mainAxisSpacing: 10,
          //         mainAxisExtent: 45),
          //     itemCount: timings.length,
          //     itemBuilder: (context, index) {
          //       return TimeGridChild(
          //           time: timings[index],
          //           onTap: () {
          //             // ref
          //             //     .read(appointmentBookingProvide.notifier)
          //             //     .state
          //             //     .appointmentTime = timings[index];
          //             // setState(() {});
          //           },
          //           selected: true);
          //     },
          //   ),
          // ),
        ]));
  }

  final List<String> timings = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 AM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "05:00 PM",
  ];
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

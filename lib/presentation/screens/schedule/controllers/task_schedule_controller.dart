import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskScheduleController extends GetxController {
  final timeStartFormat = false.obs;
  final timeEndFormat = false.obs;
  int timeStandard = 0;
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  List<DateTime> selectedDates = [];
  Map<String, List<DateTime>> daysOfWeek = {
    'Sun': [],
    'Mon': [],
    'Tue': [],
    'Wed': [],
    'Thu': [],
    'Fri': [],
    'Sat': [],
  };
  void generateDatesForMonth(int year, int month) {
    DateTime firstDayOfMonth = DateTime(year, month);
    DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

    List<DateTime> dates = [];

    // Get the previous dates that are in the same week as the first day of the current month
    int previousMonthDays = firstDayOfMonth.weekday;
    for (int i = 1; i <= previousMonthDays; i++) {
      dates.add(firstDayOfMonth.subtract(Duration(days: i)));
    }

    // Generate dates for the current month
    for (int i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
      DateTime date = DateTime(year, month, i);
      dates.add(date);
    }

    // Get the next dates that are in the same week as the last day of the current month
    int nextMonthDays = 6 - lastDayOfMonth.weekday;
    for (int i = 1; i <= nextMonthDays; i++) {
      dates.add(lastDayOfMonth.add(Duration(days: i)));
    }

    // Sort the dates to ensure they are in the correct order
    dates.sort((a, b) => a.compareTo(b));

    for (DateTime date in dates) {
      String dayOfWeek = DateFormat('E').format(date);
      daysOfWeek[dayOfWeek]?.add(date);
    }
  }

  @override
  onInit() {
    super.onInit();
    timeStandard = 0;
    generateDatesForMonth(focusedDay.value.year, focusedDay.value.month);
  }

  changetime(int i) {
    timeStandard = i;
    update();
  }

  final List<String> timings = [
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "05:00",
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
  ];
  final getStartTime = "01:00".obs;
  final i = 0.obs;
  incrementStartTime() {
    if (i < timings.length - 1) {
      timings[i.value++];
      getStartTime.value = timings[i.value];
    }
  }

  decrementStartTime() {
    if (i.value != 0) {
      timings[i.value--];
      getStartTime.value = timings[i.value];
    }
  }

  final getEndTime = "01:00".obs;
  final j = 0.obs;
  incrementEndTime() {
    if (j < timings.length - 1) {
      timings[j.value++];
      getEndTime.value = timings[j.value];
    }
  }

  decrementEndTime() {
    if (j.value != 0) {
      timings[j.value--];
      getEndTime.value = timings[j.value];
    }
  }
}

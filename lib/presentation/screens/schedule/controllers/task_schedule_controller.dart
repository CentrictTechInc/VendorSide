import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:vendor_app/app/app_router.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/common_loader.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/data/dto/schedule_dto.dart';
import 'package:vendor_app/data/repository/schedule_repository.dart';
import 'package:vendor_app/domain/repository/schedule_repository.dart';

class TaskScheduleController extends GetxController {
  ScheduleRepository repo = ScheduleRepositoryImpl();
  bool canEdit = false;
  final timeStartFormat = true.obs;
  final timeEndFormat = false.obs;
  int timeStandard = 0;
  String? timeZone;
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
    int nextMonthDays = 6 - lastDayOfMonth.weekday % 7;
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
    // timeStandard = 0;
    generateDatesForMonth(focusedDay.value.year, focusedDay.value.month);
    // await getSchedule();
  }

  @override
  onReady() async {
    super.onReady();
    await getSchedule();
  }

  setTimeStandart(int i) {
    switch (i) {
      case 0:
        timeZone = "Central";
        break;
      case 1:
        timeZone = "Eastern";
        break;
      case 2:
        timeZone = "Mountain";
        break;
      case 3:
        timeZone = "Pacific";
        break;
    }
  }

  setTimeZone(String? timeZone) {
    switch (timeZone) {
      case "Central":
        timeStandard = 0;
        break;
      case "Eastern":
        timeStandard = 1;
        break;
      case "Mountain":
        timeStandard = 2;
        break;
      case "Pacific":
        timeStandard = 3;
        break;
    }
  }

  String setTimeAmPm(bool i) {
    switch (i) {
      case true:
        return "AM";

      case false:
        return "PM";
    }
  }

  bool timeFormat(String? time) {
    switch (time) {
      case "AM":
        return true;
      case "PM":
        return false;
      default:
        return true;
    }
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

  Future updateSchedule() async {
    try {
      ShowDialogBox.showDialogBoxs(true);

      List<String> selectedDatesStrings =
          selectedDates.map((date) => date.toIso8601String()).toList();
      setTimeStandart(timeStandard);
      String startTimeFormat =
          "${getStartTime.value} ${setTimeAmPm(timeStartFormat.value)}";
      String endTimeFormat =
          "${getEndTime.value} ${setTimeAmPm(timeEndFormat.value)}";
      ScheduleDto scheduleModel = ScheduleDto(
        vid: LocalStorageService.instance.user?.vid,
        excludedDatesList: selectedDatesStrings,
        startTime: startTimeFormat,
        endTime: endTimeFormat,
        timeZone: timeZone,
      );
      final response = await repo.updateSchedule(scheduleModel: scheduleModel);
      canEdit = false;
      update();
      ToastMessage.message(response, type: ToastType.success);
      // "Your Schedule Has Been Updated Successfully"
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      return response;
    } catch (e) {
      ToastMessage.message(e.toString(), type: ToastType.error);

      rethrow;
    }
    // finally {
    //   if (ShowDialogBox.isOpen) {
    //     globalContext?.pop();
    //   }
    // }
  }

  Future getSchedule() async {
    try {
      ShowDialogBox.showDialogBoxs(true);
      final ScheduleDto response = await repo.getSchedule();

      if (response.excludedDatesList!.isNotEmpty) {
        selectedDates = response.excludedDatesList!
            .map((date) => DateTime.parse(date))
            .toList();
      }
      //for start time
      var startTimeParts = response.startTime?.split(" ") ?? ["", ""];
      getStartTime.value = startTimeParts[0];
      timeStartFormat.value = timeFormat(startTimeParts[1]);
      //for end time
      var endTimeParts = response.endTime?.split(" ") ?? ["", ""];
      getEndTime.value = endTimeParts[0];
      timeEndFormat.value = timeFormat(endTimeParts[1]);
      //for time zone
      setTimeZone(response.timeZone);

      print(response.toJson());
      if (ShowDialogBox.isOpen) {
        globalContext?.pop();
      }
      update();
      // return response;
    } catch (e) {
      rethrow;
    }
  }
}

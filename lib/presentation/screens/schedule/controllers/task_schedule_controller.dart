import 'package:get/get.dart';

class TaskScheduleController extends GetxController {
  final timeStartFormat = false.obs;
  final timeEndFormat = false.obs;
  int timeStandard = 0;
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

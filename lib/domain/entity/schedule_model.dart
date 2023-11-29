class ScheduleModel {
  int? vid;
  List<String>? excludedDatesList;
  String? startTime;
  String? endTime;
  String? timeZone;

  ScheduleModel({
    this.vid,
    this.excludedDatesList,
    this.startTime,
    this.endTime,
    this.timeZone,
  });
}

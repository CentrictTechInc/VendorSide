import 'dart:convert';

import 'package:vendor_app/domain/entity/schedule_model.dart';

class ScheduleDto extends ScheduleModel {
  ScheduleDto({
    super.vid,
    super.excludedDatesList,
    super.startTime,
    super.endTime,
    super.timeZone,
  });

  factory ScheduleDto.fromRawJson(String str) =>
      ScheduleDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScheduleDto.fromJson(Map<String, dynamic> json) => ScheduleDto(
        vid: json["vid"],
        excludedDatesList: json["excludedDates"] == null
            ? []
            : List<String>.from(
                jsonDecode(json["excludedDates"]).map((x) => x)),
        startTime: json["startTime"],
        endTime: json["endTime"],
        timeZone: json["timeZone"],
      );

  Map<String, dynamic> toJson() => {
        "vid": vid.toString(),
        "excludedDatesList": excludedDatesList == null
            ? []
            : List<dynamic>.from(excludedDatesList!.map((x) => x)),
        "startTime": startTime,
        "endTime": endTime,
        "timeZone": timeZone,
      };
}

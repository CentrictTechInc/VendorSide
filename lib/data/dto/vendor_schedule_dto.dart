import 'dart:convert';

class VendorScheduleDto {
  List<ExcludedDatesList>? excludedDatesList;

  VendorScheduleDto({
    this.excludedDatesList,
  });

  factory VendorScheduleDto.fromRawJson(String str) =>
      VendorScheduleDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorScheduleDto.fromJson(Map<String, dynamic> json) =>
      VendorScheduleDto(
        excludedDatesList: json["excludedDatesList"] == null
            ? []
            : List<ExcludedDatesList>.from(json["excludedDatesList"]!
                .map((x) => ExcludedDatesList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "excludedDatesList": excludedDatesList == null
            ? []
            : List<dynamic>.from(excludedDatesList!.map((x) => x.toJson())),
      };
}

class ExcludedDatesList {
  int? day;
  int? year;
  int? month;

  ExcludedDatesList({
    this.day,
    this.year,
    this.month,
  });

  factory ExcludedDatesList.fromRawJson(String str) =>
      ExcludedDatesList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExcludedDatesList.fromJson(Map<String, dynamic> json) =>
      ExcludedDatesList(
        day: json["day"],
        year: json["year"],
        month: json["month"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "year": year,
        "month": month,
      };
}

class VendorScheduleModel {
  List<ExcludedDatesList>? excludedDatesList;

  VendorScheduleModel({
    this.excludedDatesList,
  });
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
}

class TasksStatusResponseModel {
  String? username;
  String? serviceName;
  int? serviceId;
  int? subServiceId;
  String? subServiceName;
  String? location;
  String? appointmentDate;
  String? vehicleMake;
  String? vehicleModel;
  String? status;
  String? time;
  String? vehicleYear;
  String? description;
  String? price;
  String? vinNumber;

  TasksStatusResponseModel({
    this.username,
    this.serviceName,
    this.subServiceName,
    this.location,
    this.appointmentDate,
    this.vehicleMake,
    this.vehicleModel,
    this.status,
    this.time,
    this.vehicleYear,
    this.description,
    this.price,
    this.vinNumber,
    this.serviceId,
    this.subServiceId,
  });
}

class TasksStatusResponseModel {
  String? username;
  String? serviceName;
  String? subServiceName;
  String? location;
  String? appointmentDate;
  String? vehicleMake;
  String? vehicleModel;
  String? status;

  TasksStatusResponseModel({
    this.username,
    this.serviceName,
    this.subServiceName,
    this.location,
    this.appointmentDate,
    this.vehicleMake,
    this.vehicleModel,
    this.status,
  });
}

class TasksModel {
  TasksModel({required this.tasks});
  String tasks;
}

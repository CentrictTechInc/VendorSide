class TasksStatusResponseModel {
  int? appointmentId;
  String? username;
  String? serviceName;
  int? serviceId;
  int? subServiceId;
  String? subServiceName;
  String? location;
  String? appointmentDate;
  String? vehicleMake;
  String? vehicleModel;
  String? vehicleYear;
  String? status;
  String? time;
  String? description;
  String? price;
  String? vinNumber;
  List<QuestionsList>? questionsList;

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
    this.appointmentId,
    this.questionsList,
  });
}

class QuestionsList {
  String? question;
  String? answer;

  QuestionsList({
    this.question,
    this.answer,
  });
}

import 'dart:convert';

import 'package:vendor_app/domain/entity/tasks_model.dart';

class TasksStatusResponseDto extends TasksStatusResponseModel {
  TasksStatusResponseDto({
    super.username,
    super.serviceName,
    super.subServiceName,
    super.location,
    super.appointmentDate,
    super.vehicleMake,
    super.vehicleModel,
    super.status,
    super.description,
    super.price,
    super.time,
    super.vehicleYear,
    super.vinNumber,
    super.serviceId,
    super.subServiceId,
    super.appointmentId,
    super.questionsList,
  });

  factory TasksStatusResponseDto.fromRawJson(String str) =>
      TasksStatusResponseDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TasksStatusResponseDto.fromJson(Map<String, dynamic> json) =>
      TasksStatusResponseDto(
        username: json["username"],
        serviceId: json["serviceId"],
        serviceName: json["serviceName"],
        subServiceId: json["subServiceId"],
        subServiceName: json["subServiceName"],
        location: json["location"],
        appointmentDate: json["appointmentDate"],
        vehicleMake: json["vehicleMake"],
        vehicleModel: json["vehicleModel"],
        status: json["status"],
        time: json["appointmentTime"],
        vehicleYear: json["vehicleYear"],
        description: json["noteFromCustomer"],
        price: json["estimatedCharges"].toString() ?? '0.',
        vinNumber: json["vinNumber"] ?? '',
        appointmentId: json["appointmentId"],
        questionsList: json["questionsList"] == null
            ? null
            : List<QuestionsListDto>.from(
                json["questionsList"].map((x) => QuestionsListDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "serviceName": serviceName,
        "subServiceName": subServiceName,
        "location": location,
        "appointmentDate": appointmentDate,
        "vehicleMake": vehicleMake,
        "vehicleModel": vehicleModel,
        "status": status,
        "time": time,
        "vehicleYear": vehicleYear,
        "description": description,
        "price": price,
        "vinNumber": vinNumber,
        "serviceId": serviceId,
        "subServiceId": subServiceId,
      };
}

class QuestionsListDto extends QuestionsList {
  QuestionsListDto({
    super.question,
    super.answer,
  });

  factory QuestionsListDto.fromRawJson(String str) =>
      QuestionsListDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionsListDto.fromJson(Map<String, dynamic> json) =>
      QuestionsListDto(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}

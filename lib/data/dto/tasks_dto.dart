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
  });

  factory TasksStatusResponseDto.fromRawJson(String str) =>
      TasksStatusResponseDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TasksStatusResponseDto.fromJson(Map<String, dynamic> json) =>
      TasksStatusResponseDto(
        username: json["username"],
        serviceName: json["serviceName"],
        subServiceName: json["subServiceName"],
        location: json["location"],
        appointmentDate: json["appointmentDate"],
        vehicleMake: json["vehicleMake"],
        vehicleModel: json["vehicleModel"],
        status: json["status"],
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
      };
}

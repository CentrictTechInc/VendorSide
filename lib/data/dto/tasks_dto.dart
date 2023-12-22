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
        time: json["time"],
        vehicleYear: json["vehicleYear"],
        description: json["description"],
        price: json["price"] ?? '0.',
        vinNumber: json["vinNumber"] ?? '',
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

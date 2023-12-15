import 'dart:convert';

import 'package:vendor_app/domain/entity/task_bidding_model.dart';

class TasksBiddingDto extends TasksBiddingModel {
  TasksBiddingDto({
    super.serviceId,
    super.serviceTypeId,
    super.serviceName,
    super.priceRate,
    super.vendorId,
    super.appointmentId,
    super.subServiceName,
    super.subServiceId,
  });

  factory TasksBiddingDto.fromRawJson(String str) =>
      TasksBiddingDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TasksBiddingDto.fromJson(Map<String, dynamic> json) =>
      TasksBiddingDto(
        serviceId: json["serviceId"],
        serviceTypeId: json["serviceTypeId"],
        serviceName: json["serviceName"],
        priceRate: json["priceRate"],
        vendorId: json["vendorId"],
        appointmentId: json["appointmentId"],
        subServiceName: json["subServiceName"],
        subServiceId: json["subServiceId"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "serviceTypeId": serviceTypeId,
        "serviceName": serviceName,
        "priceRate": priceRate,
        "vendorId": vendorId,
        "appointmentId": appointmentId,
        "subServiceName": subServiceName,
        "subServiceId": subServiceId,
      };
}

import 'dart:convert';

import 'package:vendor_app/domain/entity/a_servoces_model.dart';

class AutoServicesDto extends AutoServicesModel {
  AutoServicesDto({
    super.vendorServiceId,
    super.vendorId,
    super.serviceId,
    super.serviceCharges,
    super.vendorLocation,
    super.serviceName,
    super.serviceTypeId,
    super.subServiceId,
    super.subServiceName,
  });

  factory AutoServicesDto.fromRawJson(String str) =>
      AutoServicesDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AutoServicesDto.fromJson(Map<String, dynamic> json) =>
      AutoServicesDto(
        vendorServiceId: json["vendorServiceId"],
        vendorId: json["vendorId"],
        serviceId: json["serviceId"],
        serviceCharges: json["serviceCharges"].toDouble(),
        vendorLocation: json["vendorLocation"] ?? "",
        serviceName: json["serviceName"],
        serviceTypeId: json["serviceTypeId"],
        subServiceId: json["subServiceId"],
        subServiceName: json["subServiceName"],
      );

  Map<String, dynamic> toJson() => {
        "vendorServiceId": vendorServiceId,
        "vendorId": vendorId,
        "serviceId": serviceId,
        "serviceCharges": serviceCharges,
        "vendorLocation": vendorLocation,
        "serviceName": serviceName,
        "serviceTypeId": serviceTypeId,
        "subServiceId": subServiceId,
        "subServiceName": subServiceName,
      };
}

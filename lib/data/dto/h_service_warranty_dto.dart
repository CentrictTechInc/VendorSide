import 'dart:convert';

import 'package:vendor_app/domain/entity/h_service_warranty_model.dart';

class HomeImprovementServiceDto extends HomeImprovementServiceModel {
  HomeImprovementServiceDto({
    super.vendorServiceId,
    super.vendorId,
    super.serviceId,
    super.serviceTypeId,
    super.serviceName,
    super.serviceCharges,
    super.vendorLocation,
  });

  factory HomeImprovementServiceDto.fromRawJson(String str) =>
      HomeImprovementServiceDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeImprovementServiceDto.fromJson(Map<String, dynamic> json) =>
      HomeImprovementServiceDto(
        vendorServiceId: json["vendorServiceId"],
        vendorId: json["vendorId"],
        serviceId: json["serviceId"],
        serviceTypeId: json["serviceTypeId"],
        serviceName: json["serviceName"],
        serviceCharges: json["serviceCharges"],
        vendorLocation: json["vendorLocation"],
      );

  Map<String, dynamic> toJson() => {
        "vendorServiceId": vendorServiceId,
        "vendorId": vendorId,
        "serviceId": serviceId,
        "serviceTypeId": serviceTypeId,
        "serviceName": serviceName,
        "serviceCharges": serviceCharges,
        "vendorLocation": vendorLocation,
      };
}

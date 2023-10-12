import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vendor_app/domain/entity/services_model.dart';

class ServicesDto extends ServicesModel {
  ServicesDto({
    required super.serviceId,
    required super.serviceTypeId,
    required super.serviceName,
    required super.listSubServiceName,
  });

  factory ServicesDto.fromRawJson(String str) =>
      ServicesDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServicesDto.fromJson(Map<String, dynamic> json) => ServicesDto(
        serviceId: json["serviceId"],
        serviceTypeId: json["serviceTypeId"],
        serviceName: json["serviceName"],
        listSubServiceName: List<ListSubServiceName?>.from(
            json["listSubServiceName"]
                .map((x) => x == null ? null : ListSubServiceDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "serviceTypeId": serviceTypeId,
        "serviceName": serviceName,
        "listSubServiceName":
            List<dynamic>.from(listSubServiceName.map((x) => x)),
      };
}

class ListSubServiceDto extends ListSubServiceName {
  ListSubServiceDto({
    required super.subServiceId,
    required super.subServiceName,
    super.serviceCharges,
    super.vendorCharge,
    super.isSelected,
  });

  factory ListSubServiceDto.fromRawJson(String str) =>
      ListSubServiceDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListSubServiceDto.fromJson(Map<String, dynamic> json) =>
      ListSubServiceDto(
        subServiceId: json["subServiceId"],
        subServiceName: json["subServiceName"],
        serviceCharges: TextEditingController(),
        vendorCharge: 0,
        isSelected: false,
      );

  Map<String, dynamic> toJson() => {
        "subServiceId": subServiceId,
        "subServiceName": subServiceName,
      };
}

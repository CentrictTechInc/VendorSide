import 'package:flutter/material.dart';

class AutoServicesModel {
  int? vendorServiceId;
  int? vendorId;
  int? serviceId;
  TextEditingController? serviceCharges;
  String? vendorLocation;
  String? serviceName;
  int? serviceTypeId;
  int? subServiceId;
  String? subServiceName;
  bool? isSelected;
  double? vendorPercentage;

  AutoServicesModel({
    this.vendorServiceId,
    this.vendorId,
    this.serviceId,
    this.serviceCharges,
    this.vendorLocation,
    this.serviceName,
    this.serviceTypeId,
    this.subServiceId,
    this.subServiceName,
    this.isSelected = false,
    this.vendorPercentage = 0,
  });

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

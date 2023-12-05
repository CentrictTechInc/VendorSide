import 'package:flutter/material.dart';

class ServicesModel {
  int serviceId;
  int serviceTypeId;
  String serviceName;
  bool? isSelected;
  List<ListSubServiceName?> listSubServiceName;

  ServicesModel(
      {required this.serviceId,
      required this.serviceTypeId,
      required this.serviceName,
      this.isSelected,
      required this.listSubServiceName});

//to json method
  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "serviceTypeId": serviceTypeId,
        "serviceName": serviceName,
        "isSelected": isSelected,
        "listSubServiceName": listSubServiceName
      };
}

class ListSubServiceName {
  int subServiceId;
  String subServiceName;
  TextEditingController? serviceCharges;
  double? vendorCharge;
  bool? isSelected;

  ListSubServiceName(
      {required this.subServiceId,
      required this.subServiceName,
      this.serviceCharges,
      this.vendorCharge,
      this.isSelected});
}

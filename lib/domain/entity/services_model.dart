import 'package:flutter/material.dart';

class ServicesModel {
  int serviceId;
  int serviceTypeId;
  String serviceName;
  List<ListSubServiceName?> listSubServiceName;

  ServicesModel(
      {required this.serviceId,
      required this.serviceTypeId,
      required this.serviceName,
      required this.listSubServiceName});
}

class ListSubServiceName {
  int subServiceId;
  String subServiceName;
  TextEditingController? serviceCharges;

  ListSubServiceName(
      {required this.subServiceId,
      required this.subServiceName,
      this.serviceCharges});
}

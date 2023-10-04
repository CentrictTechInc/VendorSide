import 'package:flutter/material.dart';

class VendorRegistrationModel {
  int vid;
  TextEditingController vendortype;
  TextEditingController vendorCompanyName;
  TextEditingController vendoraddress;
  TextEditingController vendorCity;
  TextEditingController vendorRegion;
  TextEditingController vendorPostalcode;
  TextEditingController vendorMobileDetail;
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController jobTitle;
  TextEditingController vendoremail;
  TextEditingController vendorPassword;
  bool isActive;
  int serviceTypeId;

  VendorRegistrationModel({
    required this.vid,
    required this.vendortype,
    required this.vendorCompanyName,
    required this.vendoraddress,
    required this.vendorCity,
    required this.vendorRegion,
    required this.vendorPostalcode,
    required this.vendorMobileDetail,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.vendoremail,
    required this.vendorPassword,
    required this.isActive,
    required this.serviceTypeId,
  });
}

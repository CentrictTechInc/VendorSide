import 'dart:convert';
import 'package:vendor_app/domain/entity/registration_model.dart';

class VendorRegistrationDto extends VendorRegistrationModel {
  VendorRegistrationDto({
    required super.vid,
    required super.vendortype,
    required super.vendorCompanyName,
    required super.vendoraddress,
    required super.vendorCity,
    required super.vendorRegion,
    required super.vendorPostalcode,
    required super.vendorMobileDetail,
    required super.firstName,
    required super.lastName,
    required super.jobTitle,
    required super.vendoremail,
    required super.vendorPassword,
    required super.isActive,
    required super.serviceTypeId,
  });

  factory VendorRegistrationDto.fromRawJson(String str) =>
      VendorRegistrationDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorRegistrationDto.fromJson(Map<String, dynamic> json) =>
      VendorRegistrationDto(
        vid: json["vid"],
        vendortype: json["vendortype"],
        vendorCompanyName: json["vendorCompanyName"],
        vendoraddress: json["vendoraddress"],
        vendorCity: json["vendorCity"],
        vendorRegion: json["vendorRegion"],
        vendorPostalcode: json["vendorPostalcode"],
        vendorMobileDetail: json["vendorMobileDetail"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        jobTitle: json["jobTitle"],
        vendoremail: json["vendoremail"],
        vendorPassword: json["vendorPassword"],
        isActive: json["isActive"],
        serviceTypeId: json["serviceTypeId"],
      );

  Map<String, dynamic> toJson() => {
        "vid": vid,
        "vendortype": vendortype,
        "vendorCompanyName": vendorCompanyName,
        "vendoraddress": vendoraddress,
        "vendorCity": vendorCity,
        "vendorRegion": vendorRegion,
        "vendorPostalcode": vendorPostalcode,
        "vendorMobileDetail": vendorMobileDetail,
        "firstName": firstName,
        "lastName": lastName,
        "jobTitle": jobTitle,
        "vendoremail": vendoremail,
        "vendorPassword": vendorPassword,
        "isActive": isActive,
        "serviceTypeId": serviceTypeId,
      };
}

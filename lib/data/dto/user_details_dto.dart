import 'dart:convert';

import 'package:vendor_app/domain/entity/user_details_model.dart';

class ProfileDetailsDto extends ProfileDetailsModel {
  ProfileDetailsDto({
    super.vid,
    super.vendortype,
    super.vendorCompanyName,
    super.vendoraddress,
    super.vendorCity,
    super.vendorRegion,
    super.vendorPostalcode,
    super.vendorMobileDetail,
    super.firstName,
    super.lastName,
    super.jobTitle,
    super.vendoremail,
  });

  factory ProfileDetailsDto.fromRawJson(String str) =>
      ProfileDetailsDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileDetailsDto.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsDto(
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
      };
}

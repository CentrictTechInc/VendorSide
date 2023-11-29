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
    super.isActive,
    super.serviceTypeId,
    super.excludedDates,
    super.pictureData,
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
        isActive: json["isActive"],
        serviceTypeId: json["serviceTypeId"],
        excludedDates: json["excludedDates"],
        pictureData: json["pictureData"],
      );

  Map<String, String> toJson() => {
        "Vid": vid.toString(),
        "FirstName": firstName.toString(),
        "LastName": lastName.toString(),
        "VendorCompanyName": vendorCompanyName.toString(),
        "Vendoraddress": vendoraddress.toString(),
        "VendorMobileDetails": vendorMobileDetail.toString(),
      };
}

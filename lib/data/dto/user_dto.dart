import 'dart:convert';

import 'package:vendor_app/domain/entity/user_model.dart';

class UserDto extends UserModel {
  UserDto({
    super.vid,
    super.vendoremail,
    super.firstName,
    super.lastName,
    super.token,
    super.jobTitle,
    super.vendorMobileDetail,
    super.emailVerified,
    super.vendoraddress,
    super.step,
    // super.longitude,
    // super.latitude,
  });

  factory UserDto.fromRawJson(String str) => UserDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        vid: json["vid"],
        vendoremail: json["vendoremail"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        token: json["token"],
        jobTitle: json["jobTitle"],
        vendorMobileDetail: json["vendorMobileDetail"],
        emailVerified: json["emailVerified"],
        vendoraddress: json["vendoraddress"],
        step: json["step"],
      );

  Map<String, dynamic> toJson() => {
        "vid": vid,
        "vendoremail": vendoremail,
        "token": token,
        "firstName": firstName,
        "lastName": lastName,
        "jobTitle": jobTitle,
        "vendorMobileDetail": vendorMobileDetail,
        "emailVerified": emailVerified,
        "vendoraddress": vendoraddress,
        "step": step,
      };
}

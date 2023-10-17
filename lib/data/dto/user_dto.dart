import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:vendor_app/domain/entity/user_model.dart';

class UserDto extends UserModel {
  UserDto({
    required super.vid,
    required super.vendoremail,
    required super.token,
    required super.jobTitle,
    required super.vendorMobileDetail,
    required super.emailVerified,
    required super.vendoraddress,
  });

  factory UserDto.fromRawJson(String str) => UserDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        vid: json["vid"],
        vendoremail: json["vendoremail"],
        token: json["token"],
        jobTitle: json["jobTitle"],
        vendorMobileDetail: json["vendorMobileDetail"],
        emailVerified: json["emailVerified"],
        vendoraddress: json["vendoraddress"],
      );

  Map<String, dynamic> toJson() => {
        "vid": vid,
        "vendoremail": vendoremail,
        "token": token,
        "jobTitle": jobTitle,
        "vendorMobileDetail": vendorMobileDetail,
        "emailVerified": emailVerified,
        "vendoraddress": vendoraddress,
      };
}

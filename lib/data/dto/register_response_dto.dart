import 'dart:convert';

import 'package:vendor_app/domain/entity/register_model.dart';

class RegisterResponseDto extends RegisterResponseModel {
  RegisterResponseDto({
    super.vid,
    super.firstName,
    super.vendoremail,
    super.message,
  });

  factory RegisterResponseDto.fromRawJson(String str) =>
      RegisterResponseDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      RegisterResponseDto(
        vid: json["vid"],
        firstName: json["firstName"],
        vendoremail: json["vendoremail"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "vid": vid,
        "firstName": firstName,
        "vendoremail": vendoremail,
        "message": message,
      };
}

import 'dart:convert';
import 'package:vendor_app/domain/entity/user_details_model.dart';

class UserDetailsDto extends UserDetails {
  UserDetailsDto(
      {required super.userId,
      required super.userName,
      required super.email,
      required super.phone,
      required super.address,
      super.longitude,
      super.latitude});

  factory UserDetailsDto.fromRawJson(String str) =>
      UserDetailsDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetailsDto.fromJson(Map<String, dynamic> json) => UserDetailsDto(
        userId: json["userId"],
        userName: json["userName"],
        email: json["email"],
        phone: json["phone"] ?? "",
        address: json["address"] ?? "",
        latitude: json["latitude"] ?? 0.0,
        longitude: json["longitude"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "email": email,
        "phone": phone,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
      };
}

import 'dart:convert';
import 'package:vendor_app/domain/entity/user_model.dart';

class UserDto extends UserModel {
  UserDto({
    super.address,
    super.email,
    super.password,
    super.phoneNumber,
    super.roleName,
    super.token,
    super.userId,
    super.userName,
  });

  factory UserDto.fromRawJson(String str) => UserDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
      userId: json["userId"],
      email: json["email"],
      password: json["password"],
      token: json["token"],
      roleName: json["roleName"],
      phoneNumber: json["phoneNumber"],
      address: json["address"],
      userName: json["username"]);

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "password": password,
        "token": token,
        "roleName": roleName,
        "phoneNumber": phoneNumber,
        "address": address,
        "username": userName,
      };
}

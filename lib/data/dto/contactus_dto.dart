import 'dart:convert';

import 'package:vendor_app/domain/entity/contact_model.dart';

class ContactUsDto extends ContactUs {
  ContactUsDto({
    required super.contactId,
    required super.contactName,
    required super.vendorShopName,
    required super.email,
    required super.phoneNumber,
    required super.comment,
  });

  factory ContactUsDto.fromRawJson(String str) =>
      ContactUsDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactUsDto.fromJson(Map<String, dynamic> json) => ContactUsDto(
        contactId: json["contactId"],
        contactName: json["contactName"],
        vendorShopName: json["vendorShopName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "contactId": contactId,
        "contactName": contactName,
        "vendorShopName": vendorShopName,
        "email": email,
        "phoneNumber": phoneNumber,
        "comment": comment,
      };
}

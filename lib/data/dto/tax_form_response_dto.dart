import 'dart:convert';
import 'package:vendor_app/domain/entity/tax_form_response_model.dart';

class TaxFromResponseDto extends TaxFromResponseModel {
  TaxFromResponseDto({
    required super.certificateid,
    required super.message,
  });

  factory TaxFromResponseDto.fromRawJson(String str) =>
      TaxFromResponseDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaxFromResponseDto.fromJson(Map<String, dynamic> json) =>
      TaxFromResponseDto(
        certificateid: json["certificateid"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "certificateid": certificateid,
        "message": message,
      };
}

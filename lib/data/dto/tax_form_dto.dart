import 'dart:convert';

import 'package:vendor_app/domain/entity/tax_form_model.dart';

class TaxFromDto extends TaxFromModel {
  TaxFromDto({
    required super.fileName,
    required super.vendorId,
    super.taxForm,
  });

  factory TaxFromDto.fromRawJson(String str) =>
      TaxFromDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaxFromDto.fromJson(Map<String, dynamic> json) => TaxFromDto(
        fileName: json["FileName"],
        vendorId: json["VendorId"],
        taxForm: json["TaxForm"],
      );

  Map<String, String> toJson() => {
        "FileName": fileName.toString(),
        "VendorId": vendorId.toString(),
      };
}

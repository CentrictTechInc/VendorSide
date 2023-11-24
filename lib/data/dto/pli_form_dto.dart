import 'dart:convert';

import 'package:vendor_app/domain/entity/pli_form_model.dart';

class PLIFormDto extends PLIFormModel {
  PLIFormDto({
    required super.certificateId,
    required super.fileName,
    required super.vendorId,
    super.pliFile,
  });
  factory PLIFormDto.fromRawJson(String str) =>
      PLIFormDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  factory PLIFormDto.fromJson(Map<String, dynamic> json) {
    return PLIFormDto(
      certificateId: json['CertificateId'],
      fileName: json['FileName'],
      vendorId: json['VendorId'],
      pliFile: json['PliFileName'],
    );
  }

  Map<String, String> toJson() => {
        'CertificateId': certificateId.toString(),
        'FileName': fileName.toString(),
        'VendorId': vendorId.toString(),
      };
}

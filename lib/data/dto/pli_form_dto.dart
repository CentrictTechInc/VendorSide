import 'dart:convert';

import 'package:vendor_app/domain/entity/pli_form_model.dart';

class PLIFormDto extends PLIFormModel {
  PLIFormDto({
    required super.certificateId,
    required super.fileName,
    required super.vendorId,
    required super.pliFile,
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

  Map<String, dynamic> toJson() => {
        'CertificateId': certificateId,
        'FileName': fileName,
        'VendorId': vendorId,
        'PliFileName': pliFile,
      };
}

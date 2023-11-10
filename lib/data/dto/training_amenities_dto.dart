import 'dart:convert';

import 'package:vendor_app/domain/entity/training_amenitier_model.dart';

class TrainingAmenitiesDto extends TrainingAmenitierModel {
  TrainingAmenitiesDto({
    super.vid,
    super.serviceWarranty,
    super.certificateName,
    super.trainingCertificate,
    super.amenities,
  });

  factory TrainingAmenitiesDto.fromRawJson(String str) =>
      TrainingAmenitiesDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrainingAmenitiesDto.fromJson(Map<String, dynamic> json) =>
      TrainingAmenitiesDto(
        vid: json["Vid"],
        serviceWarranty: json["ServiceWarranty"],
        certificateName: json["CertificateName"],
        trainingCertificate: json["TrainingCertificate"],
        amenities: json["Amenities"],
      );

  Map<String, dynamic> toJson() => {
        "Vid": vid,
        "ServiceWarranty": serviceWarranty,
        "CertificateName": certificateName,
        "TrainingCertificate": trainingCertificate,
        "Amenities": amenities == null ? [] : List<dynamic>.from(amenities!),
      };
}

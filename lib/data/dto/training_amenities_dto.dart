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

  Map<String, String> toJson() {
    Map<String, String> obj = {
      "Vid": vid.toString(),
      "ServiceWarranty": serviceWarranty.toString(),
      "CertificateName": certificateName.toString(),
    };
    if (amenities != null && amenities!.isNotEmpty) {
      for (var i = 0; i < amenities!.length; i++) {
        obj["Amenities[$i]"] = amenities![i];
      }
    }
    return obj;
  }
}

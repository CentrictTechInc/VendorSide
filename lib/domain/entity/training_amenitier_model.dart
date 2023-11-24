class TrainingAmenitierModel {
  TrainingAmenitierModel({
    this.vid,
    this.serviceWarranty,
    this.certificateName,
    this.trainingCertificate,
    this.amenities,
  });

  final int? vid;
  final String? serviceWarranty;
  final String? certificateName;
  final String? trainingCertificate;
  final List<String>? amenities;
}

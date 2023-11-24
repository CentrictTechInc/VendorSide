class PLIFormModel {
  int certificateId;
  int vendorId;
  String fileName;
  String? pliFile;

  PLIFormModel({
    required this.certificateId,
    required this.fileName,
    required this.vendorId,
    this.pliFile,
  });
}

import 'dart:io';

class TaxFromModel {
  String fileName;
  int vendorId;
  File? taxForm;

  TaxFromModel({
    required this.fileName,
    required this.vendorId,
    this.taxForm,
  });
}

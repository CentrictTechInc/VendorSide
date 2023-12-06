class AutoServicesModel {
  int? vendorServiceId;
  int? vendorId;
  int? serviceId;
  double? serviceCharges;
  String? vendorLocation;
  String? serviceName;
  int? serviceTypeId;
  int? subServiceId;
  String? subServiceName;
  bool? isSelected;

  AutoServicesModel({
    this.vendorServiceId,
    this.vendorId,
    this.serviceId,
    this.serviceCharges,
    this.vendorLocation,
    this.serviceName,
    this.serviceTypeId,
    this.subServiceId,
    this.subServiceName,
    this.isSelected = false,
  });

  Map<String, dynamic> toJson() => {
        "vendorServiceId": vendorServiceId,
        "vendorId": vendorId,
        "serviceId": serviceId,
        "serviceCharges": serviceCharges,
        "vendorLocation": vendorLocation,
        "serviceName": serviceName,
        "serviceTypeId": serviceTypeId,
        "subServiceId": subServiceId,
        "subServiceName": subServiceName,
      };
}

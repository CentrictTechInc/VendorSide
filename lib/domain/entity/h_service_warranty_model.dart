class HomeImprovementServiceModel {
  int? vendorServiceId;
  int? vendorId;
  int? serviceId;
  int? serviceTypeId;
  String? serviceName;

  double? serviceCharges;
  String? vendorLocation;

  HomeImprovementServiceModel({
    this.vendorServiceId,
    this.vendorId,
    this.serviceId,
    this.serviceTypeId,
    this.serviceName,
    this.serviceCharges,
    this.vendorLocation,
  });
}

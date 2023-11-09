class ServicePricingModel {
  List<ServicePrice>? servicePrices;

  ServicePricingModel({
    this.servicePrices,
  });
}

class ServicePrice {
  int? vendorId;
  int? serviceId;
  int? serviceTypeId;
  int? subServiceId;
  String? subServiceName;
  String? serviceName;
  DateTime? registerDate;
  int? serviceCharges;

  ServicePrice({
    this.vendorId,
    this.serviceId,
    this.serviceTypeId,
    this.subServiceId,
    this.subServiceName,
    this.serviceName,
    this.registerDate,
    this.serviceCharges,
  });
}

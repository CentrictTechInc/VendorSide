import 'dart:convert';

class ServicePricingDto {
  List<ServicePrice>? servicePrices;

  ServicePricingDto({
    this.servicePrices,
  });

  factory ServicePricingDto.fromRawJson(String str) =>
      ServicePricingDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServicePricingDto.fromJson(Map<String, dynamic> json) =>
      ServicePricingDto(
        servicePrices: json["servicePrices"] == null
            ? []
            : List<ServicePrice>.from(
                json["servicePrices"]!.map((x) => ServicePrice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "servicePrices": servicePrices == null
            ? []
            : List<ServicePrice>.from(servicePrices!.map((x) => x.toJson())),
      };
}

class ServicePrice {
  int? vendorId;
  int? serviceId;
  int? serviceTypeId;
  int? subServiceId;
  String? subServiceName;
  String? serviceName;
  String? registerDate;
  double? serviceCharges;

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

  factory ServicePrice.fromRawJson(String str) =>
      ServicePrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServicePrice.fromJson(Map<String, dynamic> json) => ServicePrice(
        vendorId: json["vendorId"],
        serviceId: json["serviceId"],
        serviceTypeId: json["serviceTypeId"],
        subServiceId: json["subServiceId"],
        subServiceName: json["subServiceName"],
        serviceName: json["serviceName"],
        registerDate: json["registerDate"],
        serviceCharges: json["serviceCharges"],
      );

  Map<String, dynamic> toJson() => {
        "vendorId": vendorId,
        "serviceId": serviceId,
        "serviceTypeId": serviceTypeId,
        "subServiceId": subServiceId,
        "subServiceName": subServiceName,
        "serviceName": serviceName,
        "registerDate": registerDate,
        "serviceCharges": serviceCharges,
      };
}

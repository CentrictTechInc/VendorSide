import 'dart:convert';
import 'dart:io';

import 'package:vendor_app/data/dto/h_service_warranty_dto.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/dto/training_amenities_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum ServiceAmenitiesAPIType {
  trainingAndAminities,
  servicePackagePricing,
  homeServicePriceUpdate
}

class ServiceAmenitiesAPI implements APIRequestRepresentable {
  ServiceAmenitiesAPIType type;
  TrainingAmenitiesDto? amenitiesDto;
  ServicePricingDto? servicePricingDto;
  List<ServicePrice>? listOfServicePrice;
  List<File>? certificateImage = [];
  HomeImprovementServiceDto? homeServiceDto;
  ServiceAmenitiesAPI._({
    required this.type,
    this.amenitiesDto,
    this.certificateImage,
    this.servicePricingDto,
    this.listOfServicePrice,
    this.homeServiceDto,
  });

  ServiceAmenitiesAPI.uploadTrainingAmenitiesForm(
      TrainingAmenitiesDto data, List<File> trainingAmenitiesImage)
      : this._(
            type: ServiceAmenitiesAPIType.trainingAndAminities,
            amenitiesDto: data,
            certificateImage: trainingAmenitiesImage);

  ServiceAmenitiesAPI.servicePackagePricing(List<ServicePrice> data)
      : this._(
            type: ServiceAmenitiesAPIType.servicePackagePricing,
            listOfServicePrice: data);

  ServiceAmenitiesAPI.homeServicePriceUpdate(HomeImprovementServiceDto data)
      : this._(
            type: ServiceAmenitiesAPIType.homeServicePriceUpdate,
            homeServiceDto: data);
  @override
  get body {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return {
          "data": amenitiesDto!.toJson(),
          "TrainingCertificate": certificateImage
        };
      case ServiceAmenitiesAPIType.servicePackagePricing:
        return jsonEncode({
          "servicePrices": listOfServicePrice?.map((e) => e.toJson()).toList()
        });
      case ServiceAmenitiesAPIType.homeServicePriceUpdate:
        return homeServiceDto?.toJson();
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return {'Content-Type': 'multipart/form-data'};
      case ServiceAmenitiesAPIType.servicePackagePricing:
        return {};
      case ServiceAmenitiesAPIType.homeServicePriceUpdate:
        return {"Content-Type": "application/json"};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return HTTPMethod.multiPart;
      case ServiceAmenitiesAPIType.servicePackagePricing:
      case ServiceAmenitiesAPIType.homeServicePriceUpdate:
        return HTTPMethod.post;
    }
  }

  @override
  String get path {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return APIEndpoint.trainingAndAmenitiesUrl;
      case ServiceAmenitiesAPIType.servicePackagePricing:
        return APIEndpoint.servicePackagePricingUrl;
      case ServiceAmenitiesAPIType.homeServicePriceUpdate:
        return APIEndpoint.homeImprovementServiceUrl;
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url {
    return endpoint + path;
  }

  @override
  Map<String, String>? get urlParams {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
      case ServiceAmenitiesAPIType.servicePackagePricing:
      case ServiceAmenitiesAPIType.homeServicePriceUpdate:
        return {};
    }
  }
}

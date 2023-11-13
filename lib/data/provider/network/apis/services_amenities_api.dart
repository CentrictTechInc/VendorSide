import 'dart:io';

import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/dto/training_amenities_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum ServiceAmenitiesAPIType { trainingAndAminities, servicePackagePricing }

class ServiceAmenitiesAPI implements APIRequestRepresentable {
  ServiceAmenitiesAPIType type;
  TrainingAmenitiesDto? amenitiesDto;
  ServicePricingDto? servicePricingDto;
  List<File>? certificateImage = [];
  ServiceAmenitiesAPI._(
      {required this.type,
      this.amenitiesDto,
      this.certificateImage,
      this.servicePricingDto});

  ServiceAmenitiesAPI.uploadTrainingAmenitiesForm(
      TrainingAmenitiesDto data, List<File> trainingAmenitiesImage)
      : this._(
            type: ServiceAmenitiesAPIType.trainingAndAminities,
            amenitiesDto: data,
            certificateImage: trainingAmenitiesImage);

  ServiceAmenitiesAPI.servicePackagePricing(ServicePricingDto data)
      : this._(
            type: ServiceAmenitiesAPIType.servicePackagePricing,
            servicePricingDto: data);
  @override
  get body {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return {
          "data": amenitiesDto!.toJson(),
          "TrainingCertificate": certificateImage
        };
      case ServiceAmenitiesAPIType.servicePackagePricing:
        return {
          "data": servicePricingDto!.toJson(),
        };
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
        return {"Content-Type": "application/json"};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return HTTPMethod.multiPart;
      case ServiceAmenitiesAPIType.servicePackagePricing:
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
        return {};
    }
  }
}

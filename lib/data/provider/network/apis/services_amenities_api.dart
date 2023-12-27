import 'dart:convert';
import 'dart:io';

import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/h_service_warranty_dto.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/dto/training_amenities_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum ServiceAmenitiesAPIType {
  trainingAndAminities,
  servicePackagePricing,
  postHIServicePricing,
  getHIServicePricing,
  putHIServicePricing
}

class ServiceAmenitiesAPI implements APIRequestRepresentable {
  ServiceAmenitiesAPIType type;
  TrainingAmenitiesDto? amenitiesDto;
  ServicePricingDto? servicePricingDto;
  List<ServicePrice>? listOfServicePrice;
  List<File>? certificateImage = [];
  HomeImprovementServiceDto? homeServiceDto;
  int? vendorId;
  ServiceAmenitiesAPI._(
      {required this.type,
      this.amenitiesDto,
      this.certificateImage,
      this.servicePricingDto,
      this.listOfServicePrice,
      this.homeServiceDto,
      this.vendorId});

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

  ServiceAmenitiesAPI.postHIServicePricing(HomeImprovementServiceDto data)
      : this._(
            type: ServiceAmenitiesAPIType.postHIServicePricing,
            homeServiceDto: data);
  ServiceAmenitiesAPI.putHIServicePricing(HomeImprovementServiceDto data)
      : this._(
            type: ServiceAmenitiesAPIType.putHIServicePricing,
            homeServiceDto: data);

  ServiceAmenitiesAPI.getHIServicePricing(int id)
      : this._(type: ServiceAmenitiesAPIType.getHIServicePricing, vendorId: id);

  @override
  get body {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return {
          "data": amenitiesDto!.toJson(),
          "TrainingCertificate": certificateImage
        };
      case ServiceAmenitiesAPIType.servicePackagePricing:
        Map<String, dynamic> payload = {
          "servicePrices": listOfServicePrice?.map((e) => e.toJson()).toList()
        };
        return jsonEncode(payload);
      // return jsonEncode({
      //   "servicePrices": listOfServicePrice?.map((e) => e.toJson()).toList()
      // });
      case ServiceAmenitiesAPIType.postHIServicePricing:
      case ServiceAmenitiesAPIType.putHIServicePricing:
        return homeServiceDto?.toRawJson();
      case ServiceAmenitiesAPIType.getHIServicePricing:
        return {};
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return {'Content-Type': 'multipart/form-data'};
      case ServiceAmenitiesAPIType.getHIServicePricing:
      case ServiceAmenitiesAPIType.servicePackagePricing:
      case ServiceAmenitiesAPIType.postHIServicePricing:
      case ServiceAmenitiesAPIType.putHIServicePricing:
        return {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${LocalStorageService.instance.user?.token}'
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return HTTPMethod.multiPart;
      case ServiceAmenitiesAPIType.servicePackagePricing:
      case ServiceAmenitiesAPIType.postHIServicePricing:
        return HTTPMethod.post;
      case ServiceAmenitiesAPIType.putHIServicePricing:
        return HTTPMethod.put;
      case ServiceAmenitiesAPIType.getHIServicePricing:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return APIEndpoint.trainingAndAmenitiesUrl;
      case ServiceAmenitiesAPIType.servicePackagePricing:
        return APIEndpoint.servicePackagePricingUrl;
      case ServiceAmenitiesAPIType.postHIServicePricing:
      case ServiceAmenitiesAPIType.putHIServicePricing:
        return APIEndpoint.hIAddServiceUrl;
      case ServiceAmenitiesAPIType.getHIServicePricing:
        return APIEndpoint.getHIServiceUrl;
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
      case ServiceAmenitiesAPIType.postHIServicePricing:
      case ServiceAmenitiesAPIType.putHIServicePricing:
        return {};
      case ServiceAmenitiesAPIType.getHIServicePricing:
        return {"vendorId": vendorId.toString()};
    }
  }
}

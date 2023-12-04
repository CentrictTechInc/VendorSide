import 'dart:convert';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum AutoServiceAPIType { updateAutoServices, getAutoServices }

class AutoServiceAPI extends APIRequestRepresentable {
  AutoServiceAPIType type;
  List<ServicePrice>? listOfServicePrice;
  AutoServiceAPI._({required this.type, this.listOfServicePrice});
  AutoServiceAPI.updateAutoServices(List<ServicePrice> listOfServicePrice)
      : this._(
            type: AutoServiceAPIType.updateAutoServices,
            listOfServicePrice: listOfServicePrice);
  AutoServiceAPI.getAutoServices()
      : this._(type: AutoServiceAPIType.getAutoServices);

  @override
  get body {
    switch (type) {
      case AutoServiceAPIType.updateAutoServices:
        Map<String, dynamic> payload = {
          "updateServicePrices":
              listOfServicePrice?.map((e) => e.toJson()).toList()
        };
        return jsonEncode(payload);
      case AutoServiceAPIType.getAutoServices:
        return {
          'vendorId': LocalStorageService.instance.user?.vid.toString() ?? '',
        };
    }
  }

  @override
  get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    return {'Content-Type': 'application/json'};
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AutoServiceAPIType.updateAutoServices:
        return HTTPMethod.post;

      case AutoServiceAPIType.getAutoServices:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case AutoServiceAPIType.updateAutoServices:
        return APIEndpoint.updateScheduleUrl;

      case AutoServiceAPIType.getAutoServices:
        return APIEndpoint.getAutoServiceByIdUrl;
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get urlParams {
    switch (type) {
      case AutoServiceAPIType.updateAutoServices:
        return {};
      case AutoServiceAPIType.getAutoServices:
        return {
          'vendorId': LocalStorageService.instance.user?.vid.toString() ?? '',
        };
    }
  }
}

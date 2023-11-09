import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum ServiceAmenitiesAPIType { trainingAndAminities, servicePackagePricing }

class ServiceAmenitiesAPI implements APIRequestRepresentable {
  ServiceAmenitiesAPIType type;
  ServiceAmenitiesAPI._({required this.type});
  @override
  get body {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
      case ServiceAmenitiesAPIType.servicePackagePricing:
        return '';
    }
  }

  @override
  String get endpoint {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
        return APIEndpoint.trainingAndAmenitiesUrl;
      case ServiceAmenitiesAPIType.servicePackagePricing:
        return APIEndpoint.servicePackagePricingUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
      case ServiceAmenitiesAPIType.servicePackagePricing:
        return {"Content-Type": "application/json"};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case ServiceAmenitiesAPIType.trainingAndAminities:
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

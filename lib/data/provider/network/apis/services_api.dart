import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum ServiceAPIType { getAllServices }

class ServiceAPI extends APIRequestRepresentable {
  ServiceAPIType type;

  ServiceAPI._({required this.type});
  ServiceAPI.getAllServices() : this._(type: ServiceAPIType.getAllServices);

  @override
  get body {}

  @override
  get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    return {'Content-Type': 'application/json; charset=utf-8'};
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case ServiceAPIType.getAllServices:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case ServiceAPIType.getAllServices:
        return APIEndpoint.getAllServicesUrl;
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
      case ServiceAPIType.getAllServices:
        return {};
    }
  }
}

import 'package:vendor_app/data/dto/h_service_warranty_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum HIServiceAPIType { postHIServices }

class HIServiceAPI extends APIRequestRepresentable {
  HIServiceAPIType type;
  HomeImprovementServiceDto? data;

  HIServiceAPI._({required this.type, this.data});
  HIServiceAPI.postHIServices(HomeImprovementServiceDto data)
      : this._(type: HIServiceAPIType.postHIServices, data: data);

  @override
  get body {
    switch (type) {
      case HIServiceAPIType.postHIServices:
        return data?.toRawJson();
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
      case HIServiceAPIType.postHIServices:
        return HTTPMethod.post;
    }
  }

  @override
  String get path {
    switch (type) {
      case HIServiceAPIType.postHIServices:
        return APIEndpoint.hIAddServiceUrl;
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
      case HIServiceAPIType.postHIServices:
        return {};
    }
  }
}

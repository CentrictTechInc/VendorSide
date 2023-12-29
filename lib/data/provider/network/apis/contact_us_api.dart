import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/contactus_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum ContactAPIType { contactUs }

class ContactAPI implements APIRequestRepresentable {
  ContactAPIType type;
  ContactUsDto? contactUs;
  ContactAPI._({required this.type, this.contactUs});
  ContactAPI.contactUs(contactUs)
      : this._(type: ContactAPIType.contactUs, contactUs: contactUs);

  @override
  get body {
    switch (type) {
      case ContactAPIType.contactUs:
        return contactUs?.toRawJson();
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers => {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${LocalStorageService.instance.user?.token}'
      };
  @override
  HTTPMethod get method {
    switch (type) {
      case ContactAPIType.contactUs:
        return HTTPMethod.post;
    }
  }

  @override
  String get path {
    switch (type) {
      case ContactAPIType.contactUs:
        return APIEndpoint.contactUsUrl;
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
      case ContactAPIType.contactUs:
        return {};
    }
  }
}

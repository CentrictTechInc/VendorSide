import 'package:vendor_app/data/dto/pli_form_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum TaxFromApiType {
  vendorTaxForm,
  vendorPLIForm,
}

class TaxFromAPI implements APIRequestRepresentable {
  TaxFromApiType type;
  TaxFromDto? taxFromData;
  PLIFormDto? pliFormData;

  TaxFromAPI._({
    required this.type,
    this.pliFormData,
    this.taxFromData,
  });

  TaxFromAPI.uploadTaxForm(TaxFromDto taxData)
      : this._(type: TaxFromApiType.vendorTaxForm, taxFromData: taxData);
  TaxFromAPI.uploadPLIForm(PLIFormDto pliData)
      : this._(type: TaxFromApiType.vendorTaxForm, pliFormData: pliData);

  @override
  get body {
    switch (type) {
      case TaxFromApiType.vendorTaxForm:
        return taxFromData?.toJson();
      case TaxFromApiType.vendorPLIForm:
        return pliFormData?.toJson();
    }
  }

  @override
  String get path {
    switch (type) {
      case TaxFromApiType.vendorTaxForm:
        return APIEndpoint.taxFormUrl;
      case TaxFromApiType.vendorPLIForm:
        return APIEndpoint.pLIFormUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case TaxFromApiType.vendorTaxForm:
      case TaxFromApiType.vendorPLIForm:
        return {'Content-Type': 'multipart/form-data'};
      // return {'Content-Type': 'application/json; charset=utf-8'};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case TaxFromApiType.vendorTaxForm:
      case TaxFromApiType.vendorPLIForm:
        return HTTPMethod.multiPart;
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get urlParams {
    switch (type) {
      case TaxFromApiType.vendorTaxForm:
      case TaxFromApiType.vendorPLIForm:
        return {};
    }
  }
}

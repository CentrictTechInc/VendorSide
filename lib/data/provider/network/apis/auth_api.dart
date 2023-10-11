import 'dart:convert';
import 'package:vendor_app/data/dto/registration_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum AuthApiType {
  login,
  signup,
  forgot,
  generateOtp,
  forgotEmailOtpVerification,
  mobileOtpVerification,
  resetPassword,
  createNewPassword,
  registerEmailVerification,
  vendorTaxForm
}

class AuthAPI implements APIRequestRepresentable {
  AuthApiType type;
  String? email, password, otp, confirmPassword;
  VendorRegistrationDto? data;
  TaxFromDto? taxFromData;

  AuthAPI._(
      {required this.type,
      this.email,
      this.password,
      this.otp,
      this.data,
      this.taxFromData,
      this.confirmPassword});

  AuthAPI.login(String email, String pass)
      : this._(type: AuthApiType.login, email: email, password: pass);
  AuthAPI.register(VendorRegistrationDto data)
      : this._(type: AuthApiType.signup, data: data);
  AuthAPI.generateOtp(String email)
      : this._(type: AuthApiType.generateOtp, email: email);
  AuthAPI.forgotPassword(String email)
      : this._(type: AuthApiType.forgot, email: email);
  AuthAPI.resetPassword(String email, String password, String confirmPassword)
      : this._(
            type: AuthApiType.resetPassword,
            email: email,
            confirmPassword: confirmPassword,
            password: password);
  AuthAPI.forgotEmailOtpVerification(String email, String otp)
      : this._(
            type: AuthApiType.forgotEmailOtpVerification,
            email: email,
            otp: otp);
  AuthAPI.registerEmailVerification(String email, String otp)
      : this._(
            type: AuthApiType.registerEmailVerification,
            email: email,
            otp: otp);
  AuthAPI.uploadTaxForm(TaxFromDto taxData)
      : this._(type: AuthApiType.vendorTaxForm, taxFromData: taxData);

  @override
  get body {
    switch (type) {
      case AuthApiType.login:
        return jsonEncode({'email': email, 'password': password});
      case AuthApiType.signup:
        return data?.toRawJson();
      case AuthApiType.forgotEmailOtpVerification:
      case AuthApiType.generateOtp:
      case AuthApiType.forgot:
      case AuthApiType.createNewPassword:
      case AuthApiType.registerEmailVerification:
      case AuthApiType.resetPassword:
      case AuthApiType.mobileOtpVerification:
        return {};
      case AuthApiType.vendorTaxForm:
        return taxFromData?.toJson();
    }
  }

  @override
  String get path {
    switch (type) {
      case AuthApiType.login:
        return APIEndpoint.loginUrl;
      case AuthApiType.signup:
        return APIEndpoint.registerUrl;
      case AuthApiType.generateOtp:
        return APIEndpoint.generateOtpUrl;
      case AuthApiType.forgot:
        return APIEndpoint.forgotPasswordUrl;
      case AuthApiType.resetPassword:
        return APIEndpoint.resetPasswordUrl;
      case AuthApiType.forgotEmailOtpVerification:
        return APIEndpoint.forgotOtpVerificationUrl;
      case AuthApiType.mobileOtpVerification:
        return '';
      case AuthApiType.registerEmailVerification:
        return APIEndpoint.registerOTpVerificationUrl;
      case AuthApiType.vendorTaxForm:
        return APIEndpoint.taxFormUrl;
      case AuthApiType.createNewPassword:
        return "";
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case AuthApiType.registerEmailVerification:
        return {};
      case AuthApiType.generateOtp:
      case AuthApiType.resetPassword:
      case AuthApiType.forgotEmailOtpVerification:
      case AuthApiType.forgot:
      case AuthApiType.login:
      case AuthApiType.signup:
      case AuthApiType.mobileOtpVerification:
      case AuthApiType.createNewPassword:
        return {'Content-Type': 'application/json; charset=utf-8'};
      case AuthApiType.vendorTaxForm:
        return {'Content-Type': 'multipart/form-data'};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case AuthApiType.login:
      case AuthApiType.signup:
      case AuthApiType.mobileOtpVerification:
      case AuthApiType.createNewPassword:
      case AuthApiType.registerEmailVerification:
        return HTTPMethod.post;
      case AuthApiType.generateOtp:
      case AuthApiType.resetPassword:
      case AuthApiType.forgotEmailOtpVerification:
      case AuthApiType.forgot:
        return HTTPMethod.get;
      case AuthApiType.vendorTaxForm:
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
      case AuthApiType.login:
      case AuthApiType.signup:
      case AuthApiType.mobileOtpVerification:
      case AuthApiType.createNewPassword:
      case AuthApiType.resetPassword:
        return {
          'email': email.toString(),
          'password': password.toString(),
          'confirmPassword': confirmPassword.toString()
        };
      case AuthApiType.forgotEmailOtpVerification:
      case AuthApiType.registerEmailVerification:
        return {
          'email': email.toString(),
          'otp': otp.toString(),
          'type': 'Vendor'.toString()
        };
      case AuthApiType.generateOtp:
      case AuthApiType.forgot:
        return {'email': email.toString()};
      case AuthApiType.vendorTaxForm:
        return {};
    }
  }
}

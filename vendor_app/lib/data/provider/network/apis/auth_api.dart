import 'package:vendor_app/data/dto/registration_dto.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum AuthApiType {
  login,
  register,
  forgot,
  generateOtp,
  forgotEmailOtpVerification,
  mobileOtpVerification,
  resetPassword,
  createNewPassword,
  registerEmailVerification
}

class AuthAPI implements APIRequestRepresentable {
  AuthApiType type;
  String? email, password, otp, confirmPassword;
  VendorRegistrationDto? registrationDto;

  AuthAPI._({
    required this.type,
    this.email,
    this.confirmPassword,
    this.otp,
    this.password,
    this.registrationDto,
  });

  AuthAPI.login(String email, String pass)
      : this._(type: AuthApiType.login, email: email, password: pass);
  AuthAPI.register(VendorRegistrationDto register)
      : this._(type: AuthApiType.register);
  @override
  get body => throw UnimplementedError();

  @override
  // TODO: implement endpoint
  String get endpoint => throw UnimplementedError();

  @override
  // TODO: implement headers
  Map<String, String>? get headers => throw UnimplementedError();

  @override
  // TODO: implement method
  HTTPMethod get method => throw UnimplementedError();

  @override
  // TODO: implement path
  String get path => throw UnimplementedError();

  @override
  Future request() {
    // TODO: implement request
    throw UnimplementedError();
  }

  @override
  // TODO: implement url
  String get url => throw UnimplementedError();

  @override
  // TODO: implement urlParams
  Map<String, String>? get urlParams => throw UnimplementedError();
}

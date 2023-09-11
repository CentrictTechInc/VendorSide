import 'dart:convert';

import 'package:vendor_app/data/dto/registration_dto.dart';
import 'package:vendor_app/data/provider/network/apis/auth_api.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<String> forgot(String email) {
    // TODO: implement forgot
    throw UnimplementedError();
  }

  @override
  Future<String> forgotEmailOtpVerification(String email, String otp) {
    // TODO: implement forgotEmailOtpVerification
    throw UnimplementedError();
  }

  @override
  Future<String> generateOtp(String email) {
    // TODO: implement generateOtp
    throw UnimplementedError();
  }

  @override
  Future<String> login(String email, String password) async {
    try {
      final response = await AuthAPI.login(email, password).request();
      // UserModel user = UserDto.fromRawJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> register(VendorRegistrationDto registerDto) async {
    try {
      final response = await AuthAPI.register(registerDto).request();
      Map<String, dynamic> res = jsonDecode(response);
      return res["message"];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> registerEmailVerification(String email, String otp) {
    // TODO: implement registerEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<String> resetNewPassword(
      String email, String password, String confirmPassword) {
    // TODO: implement resetNewPassword
    throw UnimplementedError();
  }
}

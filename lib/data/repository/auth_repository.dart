import 'dart:convert';
import 'package:vendor_app/data/dto/registration_dto.dart';
import 'package:vendor_app/data/dto/user_dto.dart';
import 'package:vendor_app/data/provider/network/apis/auth_api.dart';
import 'package:vendor_app/domain/entity/user_model.dart';
import 'package:vendor_app/domain/repository/auth_repositpory.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<String> forgot(String email) async {
    try {
      final response = await AuthAPI.forgotPassword(email).request();
      Map<String, dynamic> msg = jsonDecode(response);
      return msg['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> forgotEmailOtpVerification(String email, String otp) async {
    try {
      final response =
          await AuthAPI.forgotEmailOtpVerification(email, otp).request();
      Map<String, dynamic> msg = jsonDecode(response);
      return msg['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> generateOtp(String email) async {
    try {
      final response = await AuthAPI.generateOtp(email).request();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await AuthAPI.login(email, password).request();
      UserModel user = UserDto.fromRawJson(response);
      return user;
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
  Future<String> registerEmailVerification(String email, String otp) async {
    try {
      final response =
          await AuthAPI.registerEmailVerification(email, otp).request();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> resetNewPassword(
      String email, String password, String confirmPassword) async {
    try {
      final response =
          await AuthAPI.resetPassword(email, password, confirmPassword)
              .request();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:vendor_app/data/dto/registration_dto.dart';

abstract class AuthRepository {
  Future<String> login(String email, String password);
  Future<String> register(VendorRegistrationDto registerDto);
  Future<String> forgot(String email);
  Future<String> generateOtp(String email);
  Future<String> forgotEmailOtpVerification(String email, String otp);
  Future<String> registerEmailVerification(String email, String otp);
  Future<String> resetNewPassword(
      String email, String password, String confirmPassword);
}

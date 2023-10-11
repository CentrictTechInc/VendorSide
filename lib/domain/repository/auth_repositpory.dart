import 'package:vendor_app/data/dto/registration_dto.dart';
import 'package:vendor_app/data/dto/tax_form_dto.dart';
import 'package:vendor_app/domain/entity/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<String> register(VendorRegistrationDto registerDto);
  Future<String> uploadTaxForm(TaxFromDto data);
  Future<String> forgot(String email);
  Future<String> generateOtp(String email);
  Future<String> forgotEmailOtpVerification(String email, String otp);
  Future<String> registerEmailVerification(String email, String otp);
  Future<String> resetNewPassword(
      String email, String password, String confirmPassword);
}

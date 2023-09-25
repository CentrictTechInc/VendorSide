class APIEndpoint {
  static String get baseUrl =>
      'ec2-65-1-92-255.ap-south-1.compute.amazonaws.com';
  // ---------------- Authorization --------------------
  static String get loginUrl => '/api/Account/VendorLogin';
  static String get registerUrl => '/api/Account/vendor/Registration';
  static String get registerOTpVerificationUrl =>
      '/api/Account/client/EmailVerification';
  static String get generateOtpUrl => '/api/Account/Client/GenerateOtp';
  static String get forgotPasswordUrl => '/api/Account/Client/ForgetPassword';
  static String get forgotOtpVerificationUrl =>
      '/api/Account/Client/otpverification';
  static String get newPasswordUrl => '/api/Account/Client/NewPassword';
  static String get resetPasswordUrl => '/api/Account/Client/ResetPassword';
}

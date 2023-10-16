class APIEndpoint {
  static String get baseUrl =>
      'ec2-35-154-149-43.ap-south-1.compute.amazonaws.com';
  // ---------------- Authorization --------------------
  static String get loginUrl => '/api/Account/VendorLogin';
  static String get registerUrl => '/api/Account/vendor/Registration';
  static String get registerOTpVerificationUrl =>
      '/api/Account/client/EmailVerification';
  static String get generateOtpUrl => '/api/Account/Both/GenerateOtp';
  static String get forgotPasswordUrl => '/api/Account/vendor/ForgetPassword';
  static String get forgotOtpVerificationUrl =>
      '/api/Account/Client/otpverification';
  static String get newPasswordUrl => '/api/Account/Vendor/NewPassword';
  static String get resetPasswordUrl => '/api/Account/Client/ResetPassword';
  static String get taxFormUrl => '/api/Account/vendor/TaxForm';
  static String get pLIFormUrl => '/api/Account/vendor/PLIForm';
  static String get getCertificateUrl => '/api/Account/GetCertificateId';
  static String get getAllServicesUrl => '/Services/GetAllServices';
}

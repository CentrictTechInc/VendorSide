class APIEndpoint {
  static String get baseUrl =>
      'ec2-3-110-46-6.ap-south-1.compute.amazonaws.com';
  // ---------------- Authorization --------------------
  static String get loginUrl => '/api/Account/VendorLogin';
  static String get registerUrl => '/api/Account/vendor/Registration';
  static String get registerOTpVerificationUrl =>
      '/api/Account/client/EmailVerification';
  static String get generateOtpUrl => '/api/Account/Both/GenerateOtp';
  static String get forgotPasswordUrl => '/api/Account/vendor/ForgetPassword';
  static String get forgotOtpVerificationUrl =>
      '/api/Account/Both/otpverification';
  static String get resetPasswordUrl => '/api/Account/Vendor/NewPassword';
  // ----------------Tax Form--------------------
  static String get taxFormUrl => '/api/Account/vendor/TaxForm';
  static String get pLIFormUrl => '/api/Account/vendor/PLIForm';
  static String get getCertificateUrl => '/api/Account/GetCertificateId';
  //------------------Services-------------------------
  static String get getAllServicesUrl => '/Services/GetAllServices';

  // ---------------- Profile --------------------
  static String get getProfileDetailsUrl =>
      '/api/Account/Client/GetProfileDetails';
  static String get postProfileDetailsUrl =>
      "/api/Account/Client/PostProfileDetails";

  //--------------Contact Us---------------
  static String get contactUsUrl => '/api/Account/Client/ContactUs';

  //------------Nofication----------------
  static String get notificationUrl => '/Notification/Notifications';
}

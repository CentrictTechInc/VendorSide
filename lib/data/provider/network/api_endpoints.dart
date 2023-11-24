class APIEndpoint {
  static String get baseUrl =>
      'ec2-13-233-131-19.ap-south-1.compute.amazonaws.com';
  // ---------------- Authorization --------------------
  static String get loginUrl => '/api/Vendor/VendorLogin';
  static String get registerUrl => '/api/Vendor/vendor/Registration';
  static String get registerOTpVerificationUrl =>
      '/api/Client/client/EmailVerification';
  static String get generateOtpUrl => '/api/Client/Both/GenerateOtp';
  static String get forgotPasswordUrl => '/api/Vendor/vendor/ForgetPassword';
  static String get forgotOtpVerificationUrl =>
      '/api/Client/Both/otpverification';
  static String get resetPasswordUrl => '/api/Vendor/Vendor/NewPassword';
  // ----------------Tax Form--------------------
  static String get taxFormUrl => '/api/Vendor/vendor/TaxForm';
  static String get pLIFormUrl => '/api/Vendor/vendor/PLIForm';

  //------------------Services-------------------------
  static String get getAllServicesUrl => '/Services/GetAllServices';

  // ---------------- Profile --------------------
  static String get getProfileDetailsUrl =>
      '/api/ProfileDetails/Vendor/ProfileDetails';
  static String get postProfileDetailsUrl =>
      "/api/ProfileDetails/Vendor/ProfileDetails";

  //--------------Contact Us---------------
  static String get contactUsUrl => '/api/Vendor/Vendor/ContactUs';

  //------------Nofication----------------
  static String get notificationUrl => '/Notification/Notifications';

  //------------Training and Amenities + Services----------------
  static String get trainingAndAmenitiesUrl =>
      '/Services/Vendor/TrainingAndAminities';

  static String get servicePackagePricingUrl =>
      '/Services/ServicePackagePricing';

  //------------Home Improvement Service----------------
  static String get homeImprovementAddServiceUrl => '/Services/Vendor/Services';
  static String get homeImprovementUpdateServiceUrl =>
      '/Services/Vendor/Services';

  //-----------------Vendor Service by ID -----------------
  static String get getVendorServiceByIdUrl =>
      '/Services/Vendor/VendorServicesByVendorId';

  //---------------Schedule-----------------------
  static String get updateScheduleUrl => '/api/Vendor/Vendor/VendorSchedule';
  static String get getScheduleUrl =>
      '/api/Vendor/Vendor/VendorScheduleByVendorId';
}

class APIEndpoint {
  static String get baseUrl =>
      'ec2-43-204-97-62.ap-south-1.compute.amazonaws.com';
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
  static String get getAllServicesUrl => '/api/Service/GetAllServices';

  // ---------------- Profile --------------------
  static String get getProfileDetailsUrl =>
      '/api/ProfileDetails/Vendor/ProfileDetails';
  static String get postProfileDetailsUrl =>
      "/api/ProfileDetails/Vendor/ProfileDetails";

  //--------------Contact Us---------------
  static String get contactUsUrl => '/api/Vendor/Vendor/ContactUs';

  //------------Nofication----------------
  static String get notificationUrl => '/api/Notification/Notifications';

  //------------Training and Amenities + Services----------------
  static String get trainingAndAmenitiesUrl =>
      '/api/Service/Vendor/TrainingAndAminities';

  static String get servicePackagePricingUrl =>
      '/api/Service/Automotive/ServicePackagePricing';
  static String get updateServicePackagePricingUrl =>
      '/api/Service/Automotive/ServicePackagePricing';

  //------------Home Improvement Service----------------
  static String get hIAddServiceUrl => '/api/Service/Handyman/Services';
  static String get getHIServiceUrl =>
      '/api/Service/Handyman/ServicesByVendorId';

  //-----------------Aotomotive Service by ID -----------------
  static String get getAutoServiceByIdUrl =>
      '/api/Service/Automotive/ServicesByVendorId';
  static String get updateAutoServicePriceByIdUrl =>
      '/api/Service/Automotive/ServicePackagePricing';

  //---------------Schedule-----------------------
  static String get updateScheduleUrl => '/api/Vendor/Vendor/VendorSchedule';
  static String get getScheduleUrl =>
      '/api/Vendor/Vendor/VendorScheduleByVendorId';

  //--------------- Tasks -----------------------\
  static String get getAutoTasksUrl => '/api/Appointment/Automotive/GetTask';
  static String get getHandyTasksUrl => '/api/Appointment/Handyman/GetTask';
  static String get getAutoTaskByAppointmentIdUrl =>
      '/api/Appointment/Automotive/GetTaskById';
  static String get getHandyTaskByAppointmentIdUrl =>
      '/api/Appointment/Handyman/GetTaskById';
  static String get postBiddingUrl => '/api/Appointment/VendorBidding';
  static String get pendingAutoTasksUrl =>
      '/api/Appointment/Automotive/PendingTasks';
  static String get pendingHandymanTasksUrl =>
      '/api/Appointment/Handyman/PendingTasks';
  static String get completeAutoTasksUrl =>
      '/api/Appointment/Automotive/CompleteTask';
  static String get completeHandymanTasksUrl =>
      '/api/Appointment/Handyman/CompleteTask';
}

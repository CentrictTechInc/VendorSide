class PagePath {
  static const String slash = '/';

  static const String login = '/login';
  static const String register = '/register';

  static const String homeScreen = '/homeScreen';

  static const String schedule = 'schedule';
  static const String contact = 'contactUs';

  static const String inbox = '/messages';
  static const String notification = '/notification';

  static const String business = '/business';
  static const String approved = '/approved';
  static const String review = 'review';

  static const String profile = 'profile';
  static const String profileEdit = 'edit';

  static const String manageServices = 'services';
  static const String automotiveManageServices = 'automotiveServices';
  static const String splash = '/splash';
  static const String mobileOtp = '/mobileOtp';
  static const String emailOtp = '/emailOtp';
  static const String registerEmailOtp = '/registerEmailOtp';
  static const String forgotPasswrod = '/forgotPassword';
  static const String createNewPassword = '/createNewPassword';

  static const String vendorCharges = '/vendorCharges';

  static const String taxForm = '/taxForm';

  static const String category = '/category';
  static const String automotiveService = '/automotiveService';

  static const String tasks = 'tasks';

  static const String reviewInProcess = '/reviewInProcess';
}

extension ContextExtensionss on String {
  String get toRoute => '/$this';
}

extension toHome on String {
  String get tohome => '/homeScreen$this';
}

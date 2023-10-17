class UserModel {
  int vid;
  String vendoremail;
  String token;
  dynamic jobTitle;
  String vendorMobileDetail;
  bool emailVerified;
  String vendoraddress;

  UserModel({
    required this.vid,
    required this.vendoremail,
    required this.token,
    required this.jobTitle,
    required this.vendorMobileDetail,
    required this.emailVerified,
    required this.vendoraddress,
  });
}

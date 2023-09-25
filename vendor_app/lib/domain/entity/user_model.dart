class UserModel {
  int vid;
  String vendoremail;
  String vendorPassword;
  String token;
  dynamic jobTitle;
  String vendorMobileDetail;
  String vendoraddress;

  UserModel({
    required this.vid,
    required this.vendoremail,
    required this.vendorPassword,
    required this.token,
    required this.jobTitle,
    required this.vendorMobileDetail,
    required this.vendoraddress,
  });
}

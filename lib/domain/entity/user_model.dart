class UserModel {
  int? vid;
  String? vendoremail;
  String? firstName;
  String? lastName;
  String? token;
  String? jobTitle;
  String? vendorMobileDetail;
  bool? emailVerified;
  String? vendoraddress;
  int? step;
  int? vendorType;
  // String? longitude;
  // String? latitude;

  UserModel({
    this.vid,
    this.vendoremail,
    this.token,
    this.jobTitle,
    this.vendorMobileDetail,
    this.emailVerified,
    this.vendoraddress,
    this.firstName,
    this.lastName,
    this.step,
    this.vendorType = 2,
    // this.longitude,
    // this.latitude,
  });
}

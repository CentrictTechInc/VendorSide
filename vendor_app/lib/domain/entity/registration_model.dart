class VendorRegistrationModel {
  int vid;
  String vendortype;
  String vendorCompanyName;
  String vendoraddress;
  String vendorCity;
  String vendorRegion;
  String vendorPostalcode;
  String vendorMobileDetail;
  String firstName;
  String lastName;
  String jobTitle;
  String vendoremail;
  String vendorPassword;
  bool isActive;
  int serviceTypeId;

  VendorRegistrationModel({
    required this.vid,
    required this.vendortype,
    required this.vendorCompanyName,
    required this.vendoraddress,
    required this.vendorCity,
    required this.vendorRegion,
    required this.vendorPostalcode,
    required this.vendorMobileDetail,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.vendoremail,
    required this.vendorPassword,
    required this.isActive,
    required this.serviceTypeId,
  });
}

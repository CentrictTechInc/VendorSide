class ProfileDetailsModel {
  int? vid;
  String? vendortype;
  String? vendorCompanyName;
  String? vendoraddress;
  String? vendorCity;
  String? vendorRegion;
  String? vendorPostalcode;
  String? vendorMobileDetail;
  String? firstName;
  String? lastName;
  String? jobTitle;
  String? vendoremail;
  bool? isActive;
  int? serviceTypeId;
  String? excludedDates;
  String? pictureData;

  ProfileDetailsModel({
    this.vid,
    this.vendortype,
    this.vendorCompanyName,
    this.vendoraddress,
    this.vendorCity,
    this.vendorRegion,
    this.vendorPostalcode,
    this.vendorMobileDetail,
    this.firstName,
    this.lastName,
    this.jobTitle,
    this.vendoremail,
    this.isActive,
    this.serviceTypeId,
    this.excludedDates,
    this.pictureData,
  });
}

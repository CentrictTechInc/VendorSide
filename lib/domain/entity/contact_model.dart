class ContactUs {
  int? contactId;
  String? contactName;
  String? vendorShopName;
  String? email;
  String? phoneNumber;
  String? comment;
  int? type;

  ContactUs({
    this.contactId,
    this.contactName,
    this.vendorShopName,
    this.email,
    this.phoneNumber,
    this.comment,
    this.type = 2,
    //type 2 means its vendor
  });
}

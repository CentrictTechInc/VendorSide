class UserDetails {
  int userId;
  String userName;
  String email;
  String phone;
  String address;
  double? longitude;
  double? latitude;

  UserDetails({
    required this.userId,
    required this.userName,
    required this.email,
    required this.phone,
    required this.address,
    this.longitude,
    this.latitude,
  });
}

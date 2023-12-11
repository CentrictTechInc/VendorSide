import 'package:vendor_app/app/services/local_storage_service.dart';

class UserMessageModel {
  final int uid;
  final String email;
  final String userName;
  final String userType;
  final String fcmToken = LocalStorageService.instance.fcmToken ?? "";

  UserMessageModel({
    required this.uid,
    required this.email,
    required this.userName,
    this.userType = 'vendor',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'userType': userType,
      'fcmToken': fcmToken,
    };
  }

  factory UserMessageModel.fromMap(Map<String, dynamic> map) {
    return UserMessageModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      userType: map['userType'],
    );
  }
}

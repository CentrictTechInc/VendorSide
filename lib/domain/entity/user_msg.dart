class UserMessageModel {
  final int uid;
  final String email;
  final String userName;

  UserMessageModel({
    required this.uid,
    required this.email,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
    };
  }

  factory UserMessageModel.fromMap(Map<String, dynamic> map) {
    return UserMessageModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
    );
  }
}

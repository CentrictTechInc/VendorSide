import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  MessageModel(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.receiverEmail,
      required this.message,
      required this.timeStamp});
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String receiverEmail;
  final String message;
  final Timestamp timeStamp;

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'receiverEmail': receiverEmail,
      'message': message,
      'timeStamp': timeStamp,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'],
      senderEmail: map['senderEmail'],
      receiverId: map['receiverId'],
      receiverEmail: map['receiverEmail'],
      message: map['message'],
      timeStamp: map['timeStamp'],
    );
  }
}

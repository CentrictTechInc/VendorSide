import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/common/toast_message.dart';
import 'package:vendor_app/domain/entity/message_model.dart';
import 'package:vendor_app/domain/entity/user_msg.dart';

class FirebaseMessagingService {
  static final _singleton = FirebaseMessagingService();
  static FirebaseMessagingService get instance => _singleton;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getUsers() {
    final res = FirebaseFirestore.instance.collection('users').snapshots();
    return res;
  }

  Future addUserToFirebase() async {
    try {
      final user = LocalStorageService.instance.user;

      UserMessageModel userData = UserMessageModel(
          uid: user!.vid!,
          email: user.vendoremail!,
          userName: user.vendoremail.split('@')[0]);

      await _firestore
          .collection('users')
          .doc(user.vid.toString())
          .set(userData.toMap());
      // ToastMessage.message("success fcm message", type: ToastType.success);
    } catch (e) {
      ToastMessage.message(e.toString());
    }
  }

  Future sendMessage(
      String recieverId, String message, String recieverEmail) async {
    final user = LocalStorageService.instance.user;

    final String currentUserId = user!.vid.toString();
    final String currentUserEmail = user.vendoremail.toString();
    final Timestamp timestamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: recieverId,
        receiverEmail: recieverEmail,
        message: message,
        timeStamp: timestamp);

    //make chat room id
    List<String> ids = [currentUserId, recieverId];
    ids.sort(); //sorting this so that the ids can be same for same people
    String chatRoomId = ids.join("_");

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }
//GET MESSAGE

  Stream<QuerySnapshot> getMessage(String otherUserId) {
    final userId = LocalStorageService.instance.user!.vid.toString();

    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timeStamp', descending: true)
        .snapshots();
  }
}

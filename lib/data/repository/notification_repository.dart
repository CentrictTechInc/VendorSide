import 'package:vendor_app/data/dto/notification_dto.dart';
import 'package:vendor_app/data/provider/network/apis/notification_api.dart';
import 'package:vendor_app/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Future sendNotification(NotificatioDto notificationData) async {
    try {
      final response =
          await NotificationAPI.sendNotification(notificationData).request();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

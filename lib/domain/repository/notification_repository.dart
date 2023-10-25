import 'package:vendor_app/data/dto/notification_dto.dart';

abstract class NotificationRepository {
  Future sendNotification(NotificatioDto notificationData);
}

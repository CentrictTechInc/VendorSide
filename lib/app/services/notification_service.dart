import 'package:flutter/material.dart';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/notification_dto.dart';
import 'package:vendor_app/data/repository/notification_repository.dart';
import 'package:vendor_app/domain/repository/notification_repository.dart';

class NotificationService {
  static final _singleton = NotificationService();
  static NotificationService get intance => _singleton;

  final NotificationRepository _repo = NotificationRepositoryImpl();

  Future<void> sendNotification(String title, String message) async {
    try {
      NotificatioDto data = NotificatioDto(
        title: title,
        body: message,
        deviceToken: LocalStorageService.instance.fcmToken,
      );
      await _repo.sendNotification(data);
    } catch (e) {
      debugPrint('Error sending notification:');
    }
  }
}

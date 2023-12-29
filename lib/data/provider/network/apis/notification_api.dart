import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/notification_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum NotificationAPIType { notification }

class NotificationAPI implements APIRequestRepresentable {
  NotificationAPIType type;
  NotificatioDto? data;
  NotificationAPI._({required this.type, this.data});
  NotificationAPI.sendNotification(notificationData)
      : this._(type: NotificationAPIType.notification, data: notificationData);

  @override
  get body {
    switch (type) {
      case NotificationAPIType.notification:
        return data?.toRawJson();
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers => {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${LocalStorageService.instance.user?.token}'
      };
  @override
  HTTPMethod get method {
    switch (type) {
      case NotificationAPIType.notification:
        return HTTPMethod.post;
    }
  }

  @override
  String get path {
    switch (type) {
      case NotificationAPIType.notification:
        return APIEndpoint.notificationUrl;
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get urlParams {
    switch (type) {
      case NotificationAPIType.notification:
        return {};
    }
  }
}

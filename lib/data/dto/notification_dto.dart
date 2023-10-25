import 'dart:convert';

import 'package:vendor_app/domain/entity/notification_model.dart';

class NotificatioDto extends NotificatioModel {
  NotificatioDto({
    super.title,
    super.body,
    super.deviceToken,
  });

  factory NotificatioDto.fromRawJson(String str) =>
      NotificatioDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificatioDto.fromJson(Map<String, dynamic> json) => NotificatioDto(
        title: json["title"],
        body: json["body"],
        deviceToken: json["deviceToken"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "deviceToken": deviceToken,
      };
}

import 'dart:convert';

import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/schedule_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum ScheduleAPIType { updateSchedule, getSchedule }

class ScheduleAPI extends APIRequestRepresentable {
  ScheduleAPIType type;
  ScheduleDto? data;

  ScheduleAPI._({required this.type, this.data});
  ScheduleAPI.updateSchedule(ScheduleDto scheduleData)
      : this._(type: ScheduleAPIType.updateSchedule, data: scheduleData);
  ScheduleAPI.getSchedule() : this._(type: ScheduleAPIType.getSchedule);

  @override
  get body {
    switch (type) {
      case ScheduleAPIType.updateSchedule:
        return jsonEncode(data?.toJson());
      case ScheduleAPIType.getSchedule:
        return {};
    }
  }

  @override
  get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    return {'Content-Type': 'application/json'};
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case ScheduleAPIType.updateSchedule:
        return HTTPMethod.put;

      case ScheduleAPIType.getSchedule:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case ScheduleAPIType.updateSchedule:
        return APIEndpoint.updateScheduleUrl;
      case ScheduleAPIType.getSchedule:
        return APIEndpoint.getScheduleUrl;
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
      case ScheduleAPIType.updateSchedule:
        return {};
      case ScheduleAPIType.getSchedule:
        return {
          "vendorId": LocalStorageService.instance.user?.vid.toString() ?? ""
        };
    }
  }
}

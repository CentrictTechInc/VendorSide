import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/tasks_bidding_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum TasksAPIType { getTasks, getAutoAppointmentbyId, postBidding }

class TasksAPI extends APIRequestRepresentable {
  TasksAPIType type;
  String? status;
  String? appointmentId;
  TasksBiddingDto? biddingTask;

  TasksAPI._(
      {required this.type, this.status, this.appointmentId, this.biddingTask});
  TasksAPI.getTasks(String status)
      : this._(type: TasksAPIType.getTasks, status: status);
  TasksAPI.getAppointmentbyId(String id)
      : this._(type: TasksAPIType.getAutoAppointmentbyId, appointmentId: id);
  TasksAPI.postBidding(TasksBiddingDto biddingTask)
      : this._(type: TasksAPIType.postBidding, biddingTask: biddingTask);

  @override
  get body {
    switch (type) {
      case TasksAPIType.getTasks:
      case TasksAPIType.getAutoAppointmentbyId:
        return {};
      case TasksAPIType.postBidding:
        return biddingTask?.toRawJson();
    }
  }

  @override
  get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    return {'Content-Type': 'application/json; charset=utf-8'};
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case TasksAPIType.getTasks:
      case TasksAPIType.getAutoAppointmentbyId:
        return HTTPMethod.get;
      case TasksAPIType.postBidding:
        return HTTPMethod.post;
    }
  }

  @override
  String get path {
    switch (type) {
      case TasksAPIType.getTasks:
        return APIEndpoint.getTasksUrl;
      case TasksAPIType.getAutoAppointmentbyId:
        return APIEndpoint.getAutomotiveAppointmentbyIdUrl;
      case TasksAPIType.postBidding:
        return APIEndpoint.postBiddingUrl;
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
      case TasksAPIType.getTasks:
        return {
          'VendorId': LocalStorageService.instance.user?.vid.toString() ?? '',
          'Status': status ?? '',
        };
      case TasksAPIType.getAutoAppointmentbyId:
        return {
          'appointmentId': appointmentId ?? '',
        };
      case TasksAPIType.postBidding:
        return {};
    }
  }
}

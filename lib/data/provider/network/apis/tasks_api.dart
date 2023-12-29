import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/tasks_bidding_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum TasksAPIType {
  getAutoTasks,
  getAutoAppointmentbyId,
  getHandyAppointmentbyId,
  postBidding,
  getHandyTasks,
  completeAutoTask,
  completeHandyTask,
  pendingAutoTask,
  pendingHandyTask,
}

class TasksAPI extends APIRequestRepresentable {
  TasksAPIType type;
  String? status;
  String? appointmentId;
  TasksBiddingDto? biddingTask;

  TasksAPI._(
      {required this.type, this.status, this.appointmentId, this.biddingTask});
  TasksAPI.getTasks(String status)
      : this._(type: TasksAPIType.getAutoTasks, status: status);
  TasksAPI.getAutoAppointmentbyId(String id)
      : this._(type: TasksAPIType.getAutoAppointmentbyId, appointmentId: id);
  TasksAPI.getHandyAppointmentbyId(String id)
      : this._(type: TasksAPIType.getHandyAppointmentbyId, appointmentId: id);
  TasksAPI.postBidding(TasksBiddingDto biddingTask)
      : this._(type: TasksAPIType.postBidding, biddingTask: biddingTask);
  TasksAPI.getHandyTasks(String status)
      : this._(type: TasksAPIType.getHandyTasks, status: status);
  TasksAPI.completeAutoTask({String? appointmentId})
      : this._(
            type: TasksAPIType.completeAutoTask, appointmentId: appointmentId);
  TasksAPI.completeHandyTask({String? appointmentId})
      : this._(
            type: TasksAPIType.completeHandyTask, appointmentId: appointmentId);
  TasksAPI.pendingAutoTask() : this._(type: TasksAPIType.pendingAutoTask);
  TasksAPI.pendingHandyTask() : this._(type: TasksAPIType.pendingHandyTask);

  @override
  get body {
    switch (type) {
      case TasksAPIType.getAutoTasks:
      case TasksAPIType.getAutoAppointmentbyId:
      case TasksAPIType.getHandyAppointmentbyId:
        return {};
      case TasksAPIType.postBidding:
        return biddingTask?.toRawJson();
      case TasksAPIType.getHandyTasks:
      case TasksAPIType.completeAutoTask:
      case TasksAPIType.completeHandyTask:
      case TasksAPIType.pendingAutoTask:
      case TasksAPIType.pendingHandyTask:
    }
  }

  @override
  get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer ${LocalStorageService.instance.user?.token}'
    };
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case TasksAPIType.getAutoTasks:
      case TasksAPIType.getHandyTasks:
      case TasksAPIType.getAutoAppointmentbyId:
      case TasksAPIType.getHandyAppointmentbyId:
      case TasksAPIType.pendingAutoTask:
      case TasksAPIType.pendingHandyTask:
        return HTTPMethod.get;
      case TasksAPIType.postBidding:
        return HTTPMethod.post;
      case TasksAPIType.completeAutoTask:
      case TasksAPIType.completeHandyTask:
        return HTTPMethod.put;
    }
  }

  @override
  String get path {
    switch (type) {
      case TasksAPIType.getAutoTasks:
        return APIEndpoint.getAutoTasksUrl;
      case TasksAPIType.getAutoAppointmentbyId:
        return APIEndpoint.getAutoTaskByAppointmentIdUrl;
      case TasksAPIType.getHandyAppointmentbyId:
        return APIEndpoint.getHandyTaskByAppointmentIdUrl;
      case TasksAPIType.postBidding:
        return APIEndpoint.postBiddingUrl;
      case TasksAPIType.getHandyTasks:
        return APIEndpoint.getHandyTasksUrl;
      case TasksAPIType.completeAutoTask:
        return APIEndpoint.completeAutoTasksUrl;
      case TasksAPIType.completeHandyTask:
        return APIEndpoint.completeHandymanTasksUrl;
      case TasksAPIType.pendingAutoTask:
        return APIEndpoint.pendingAutoTasksUrl;
      case TasksAPIType.pendingHandyTask:
        return APIEndpoint.pendingHandymanTasksUrl;
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
      case TasksAPIType.getAutoTasks:
      case TasksAPIType.getHandyTasks:
        return {
          'VendorId': LocalStorageService.instance.user?.vid.toString() ?? '',
          'Status': status ?? '',
        };
      case TasksAPIType.getAutoAppointmentbyId:
      case TasksAPIType.getHandyAppointmentbyId:
        return {
          'appointmentId': appointmentId ?? '',
          'VendorId': LocalStorageService.instance.user?.vid.toString() ?? '',
        };

      case TasksAPIType.completeAutoTask:
      case TasksAPIType.completeHandyTask:
        return {
          'appointmentId': appointmentId ?? '',
        };
      case TasksAPIType.pendingAutoTask:
      case TasksAPIType.pendingHandyTask:
        return {
          'vendorId': LocalStorageService.instance.user?.vid.toString() ?? '',
        };
      case TasksAPIType.postBidding:
        return {};
    }
  }
}

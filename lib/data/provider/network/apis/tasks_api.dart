import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum TasksAPIType { getTasks }

class TasksAPI extends APIRequestRepresentable {
  TasksAPIType type;
  String? status;

  TasksAPI._({required this.type, this.status});
  TasksAPI.getTasks(String status)
      : this._(type: TasksAPIType.getTasks, status: status);

  @override
  get body {}

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
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (type) {
      case TasksAPIType.getTasks:
        return APIEndpoint.getTasksUrl;
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
    }
  }
}

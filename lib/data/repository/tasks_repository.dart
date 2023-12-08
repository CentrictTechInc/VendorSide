import 'dart:convert';

import 'package:vendor_app/data/dto/tasks_dto.dart';
import 'package:vendor_app/data/provider/network/apis/tasks_api.dart';
import 'package:vendor_app/domain/repository/tasks_repository.dart';

class TasksRepositoryImpl extends TasksRepository {
  @override
  Future<List<TasksStatusResponseDto>> getTasks({String? status}) async {
    // try {
    //   final response = await TasksAPI.getTasks(status ?? '').request();
    //   dynamic json = jsonDecode(response);
    //   List<dynamic> res = json['appointmentvendor'];
    //   List<TasksStatusResponseDto> allTasks =
    //       res.map((data) => TasksStatusResponseDto.fromJson(data)).toList();
    //   return allTasks;
    // } catch (e) {
    //   rethrow;
    // }
    try {
      // dynamic json = jsonDecode(dummyData);
      // List<dynamic> res = json['appointmentvendor'];
      List<TasksStatusResponseDto> allTasks = dummyData
          .map((data) => TasksStatusResponseDto.fromJson(data))
          .toList();
      print(allTasks);
      // if (status != null) {
      //   allTasks = allTasks.where((task) => task.status == status).toList();
      // }
      return allTasks;
    } catch (e) {
      rethrow;
    }
  }
}

List<Map<String, dynamic>> dummyData = [
  {
    "username": "John",
    "serviceName": "Brakes",
    "subServiceName": "Shoe replacement",
    "location": "Location 1",
    "appointmentDate": "2022-01-01",
    "vehicleMake": "Make 1",
    "vehicleModel": "Model 1",
    "status": "request"
  },
  {
    "username": "Jane",
    "serviceName": "Engine",
    "subServiceName": "Oil change",
    "location": "Location 2",
    "appointmentDate": "2022-01-02",
    "vehicleMake": "Make 2",
    "vehicleModel": "Model 2",
    "status": "completed"
  },
  {
    "username": "Doe",
    "serviceName": "Tires",
    "subServiceName": "Rotation",
    "location": "Location 3",
    "appointmentDate": "2022-01-03",
    "vehicleMake": "Make 3",
    "vehicleModel": "Model 3",
    "status": "past"
  },
  {
    "username": "Smith",
    "serviceName": "Transmission",
    "subServiceName": "Fluid change",
    "location": "Location 4",
    "appointmentDate": "2022-01-04",
    "vehicleMake": "Make 4",
    "vehicleModel": "Model 4",
    "status": "current"
  },
];

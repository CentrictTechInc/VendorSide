import 'dart:convert';
import 'package:vendor_app/data/dto/tasks_bidding_dto.dart';
import 'package:vendor_app/data/dto/tasks_dto.dart';
import 'package:vendor_app/data/provider/network/apis/tasks_api.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';
import 'package:vendor_app/domain/repository/tasks_repository.dart';

class TasksRepositoryImpl extends TasksRepository {
  @override
  Future<List<TasksStatusResponseModel>> getAutoTasks({String? status}) async {
    try {
      final response = await TasksAPI.getTasks(status ?? '').request();
      List<dynamic> json = jsonDecode(response);
      List<TasksStatusResponseDto> allTasks =
          json.map((data) => TasksStatusResponseDto.fromJson(data)).toList();
      return allTasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TasksStatusResponseDto> getAutoAppointmentbyId({String? id}) async {
    try {
      final response =
          await TasksAPI.getAutoAppointmentbyId(id ?? '').request();
      dynamic json = jsonDecode(response);
      TasksStatusResponseDto task = TasksStatusResponseDto.fromJson(json);
      return task;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> postBidding(TasksBiddingDto biddingTask) async {
    try {
      final response = await TasksAPI.postBidding(biddingTask).request();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> completeAutoTask({String? appointmentId}) async {
    try {
      final response =
          await TasksAPI.completeAutoTask(appointmentId: appointmentId)
              .request();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> completeHandyTask({String? appointmentId}) async {
    try {
      final response =
          await TasksAPI.completeHandyTask(appointmentId: appointmentId)
              .request();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TasksStatusResponseModel>> getHandyTasks({String? status}) async {
    try {
      final response = await TasksAPI.getHandyTasks(status ?? '').request();
      List<dynamic> json = jsonDecode(response);

      List<TasksStatusResponseDto> allTasks =
          json.map((data) => TasksStatusResponseDto.fromJson(data)).toList();
      return allTasks;
    } catch (e) {
      rethrow;
    }
    // await Future.delayed(const Duration(seconds: 1), () {});
    // return dummyData;
  }

  @override
  Future<List<TasksStatusResponseModel>> pendingAutoTask() async {
    try {
      final response = await TasksAPI.pendingAutoTask().request();
      List<dynamic> json = jsonDecode(response);

      List<TasksStatusResponseDto> allTasks =
          json.map((data) => TasksStatusResponseDto.fromJson(data)).toList();
      return allTasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TasksStatusResponseModel>> pendingHandyTask() async {
    try {
      final response = await TasksAPI.pendingHandyTask().request();
      List<dynamic> json = jsonDecode(response);

      List<TasksStatusResponseDto> allTasks =
          json.map((data) => TasksStatusResponseDto.fromJson(data)).toList();
      return allTasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TasksStatusResponseDto> getHandyAppointmentbyId({String? id}) async {
    try {
      final response =
          await TasksAPI.getHandyAppointmentbyId(id ?? '').request();
      dynamic json = jsonDecode(response);
      TasksStatusResponseDto task = TasksStatusResponseDto.fromJson(json);
      return task;
    } catch (e) {
      rethrow;
    }
  }
}

List<TasksStatusResponseDto> dummyData = [
  TasksStatusResponseDto(
    username: "John",
    serviceName: "Brakes",
    subServiceName: "Shoe replacement",
    location: "Location 1",
    appointmentDate: "2022-01-22",
    vehicleMake: "Toyota",
    vehicleModel: "Corolla",
    status: "Request",
    time: "11:00 PM",
    vehicleYear: "2010",
    description: "Brake shoe replacement",
    price: "100",
    serviceId: 1,
    subServiceId: 1,
    vinNumber: "1234567890",
  ),
  TasksStatusResponseDto(
    username: "Jane",
    serviceName: "Engine",
    subServiceName: "Oil change",
    location: "Location 2",
    appointmentDate: "2022-01-09",
    vehicleMake: "Honda",
    vehicleModel: "Civic",
    status: "Request",
    time: "10:00 PM",
    vehicleYear: "2011",
    description: "Engine oil change",
    price: "200",
    serviceId: 1,
    subServiceId: 1,
    vinNumber: "1234567890",
  ),
  TasksStatusResponseDto(
    username: "Doe",
    serviceName: "Tires",
    subServiceName: "Rotation",
    location: "Location 3",
    appointmentDate: "2022-01-03",
    vehicleMake: "Ford",
    vehicleModel: "Mustang",
    status: "Request",
    time: "10:00 PM",
    vehicleYear: "2012",
    description: "Tire rotation",
    price: "300",
    serviceId: 1,
    subServiceId: 1,
    vinNumber: "1234567890",
  ),
  TasksStatusResponseDto(
    username: "Smith",
    serviceName: "Transmission",
    subServiceName: "Fluid change",
    location: "Location 4",
    appointmentDate: "2022-01-19",
    vehicleMake: "Chevrolet",
    vehicleModel: "Camaro",
    status: "Request",
    time: "10:00 PM",
    vehicleYear: "2013",
    description: "Transmission fluid change",
    price: "400",
    serviceId: 1,
    subServiceId: 1,
    vinNumber: "1234567890",
  ),
];
List<TasksStatusResponseModel> appointmentList = [
  TasksStatusResponseModel(
    username: 'Chris Johnson',
    appointmentDate: '2023-01-11',
    location: '509 Unit 10, New Haven, CT 06530',
    serviceName: "Brakes",
    status: "Request",
    subServiceName: "Brake Pad Replacement",
    vehicleMake: "Toyota",
    vehicleModel: "Camry",
    vehicleYear: "2010",
    time: "10:00 PM",
    description: "I need the Brake pad replacement and also fuild checking",
    price: "100",
    serviceId: 1,
    subServiceId: 1,
    vinNumber: "123456789",
  )
];

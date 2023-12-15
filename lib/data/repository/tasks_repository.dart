import 'dart:convert';
import 'package:vendor_app/data/dto/tasks_bidding_dto.dart';
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
    Future.delayed(const Duration(seconds: 2), () {});
    return dummyData;
  }

  @override
  Future<TasksStatusResponseDto> getAppointmentbyId({String? id}) async {
    try {
      final response = await TasksAPI.getAppointmentbyId(id ?? '').request();
      dynamic json = jsonDecode(response);
      TasksStatusResponseDto allTasks = TasksStatusResponseDto.fromJson(json);
      return allTasks;
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
    status: "Requested",
    time: "10:00",
    vehicleYear: "2010",
    description: "Brake shoe replacement",
    price: "100",
  ),
  TasksStatusResponseDto(
    username: "Jane",
    serviceName: "Engine",
    subServiceName: "Oil change",
    location: "Location 2",
    appointmentDate: "2022-01-09",
    vehicleMake: "Honda",
    vehicleModel: "Civic",
    status: "Completed",
    time: "11:00",
    vehicleYear: "2011",
    description: "Engine oil change",
    price: "200",
  ),
  TasksStatusResponseDto(
    username: "Doe",
    serviceName: "Tires",
    subServiceName: "Rotation",
    location: "Location 3",
    appointmentDate: "2022-01-03",
    vehicleMake: "Ford",
    vehicleModel: "Mustang",
    status: "Past",
    time: "12:00",
    vehicleYear: "2012",
    description: "Tire rotation",
    price: "300",
  ),
  TasksStatusResponseDto(
    username: "Smith",
    serviceName: "Transmission",
    subServiceName: "Fluid change",
    location: "Location 4",
    appointmentDate: "2022-01-19",
    vehicleMake: "Chevrolet",
    vehicleModel: "Camaro",
    status: "Current",
    time: "13:00",
    vehicleYear: "2013",
    description: "Transmission fluid change",
    price: "400",
  ),
];

import 'package:vendor_app/data/dto/tasks_bidding_dto.dart';
import 'package:vendor_app/data/dto/tasks_dto.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';

abstract class TasksRepository {
  Future<List<TasksStatusResponseModel>> getAutoTasks({String? status});
  Future<List<TasksStatusResponseModel>> getHandyTasks({String? status});
  Future<List<TasksStatusResponseModel>> pendingAutoTask();
  Future<List<TasksStatusResponseModel>> pendingHandyTask();
  Future<TasksStatusResponseDto> getAutoAppointmentbyId({String? id});
  Future<TasksStatusResponseDto> getHandyAppointmentbyId({String? id});
  Future<String> postBidding(TasksBiddingDto biddingTask);
  Future<String> completeAutoTask({String? appointmentId});
  Future<String> completeHandyTask({String? appointmentId});
}

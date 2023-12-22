import 'package:vendor_app/data/dto/tasks_bidding_dto.dart';
import 'package:vendor_app/data/dto/tasks_dto.dart';
import 'package:vendor_app/domain/entity/tasks_model.dart';

abstract class TasksRepository {
  Future<List<TasksStatusResponseModel>> getTasks({String? status});
  Future<TasksStatusResponseDto> getAppointmentbyId({String? id});
  Future<String> postBidding(TasksBiddingDto biddingTask);
}

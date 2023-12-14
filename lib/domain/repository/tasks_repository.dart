import 'package:vendor_app/data/dto/tasks_dto.dart';

abstract class TasksRepository {
  Future<List<TasksStatusResponseDto>> getTasks({String? status});
  Future<TasksStatusResponseDto> getAppointmentbyId({String? id});
}

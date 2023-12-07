import 'dart:convert';

import 'package:vendor_app/data/dto/tasks_dto.dart';
import 'package:vendor_app/data/provider/network/apis/tasks_api.dart';
import 'package:vendor_app/domain/repository/tasks_repository.dart';

class TasksRepositoryImpl extends TasksRepository {
  @override
  Future<List<TasksStatusResponseDto>> getTasks({String? status}) async {
    try {
      final response = await TasksAPI.getTasks(status ?? '').request();
      dynamic json = jsonDecode(response);
      List<dynamic> res = json['appointmentvendor'];
      List<TasksStatusResponseDto> allTasks =
          res.map((data) => TasksStatusResponseDto.fromJson(data)).toList();
      return allTasks;
    } catch (e) {
      rethrow;
    }
  }
}

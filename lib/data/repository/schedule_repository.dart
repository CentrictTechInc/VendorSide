import 'dart:convert';
import 'package:vendor_app/data/dto/schedule_dto.dart';
import 'package:vendor_app/data/provider/network/apis/schedule_api.dart';
import 'package:vendor_app/domain/repository/schedule_repository.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  @override
  Future<ScheduleDto> getSchedule() async {
    try {
      final response = await ScheduleAPI.getSchedule().request();
      final scheduleData = ScheduleDto.fromRawJson(response);
      return scheduleData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateSchedule({required ScheduleDto scheduleModel}) async {
    try {
      final response =
          await ScheduleAPI.updateSchedule(scheduleModel).request();
      final res = jsonDecode(response);
      return res['message'];
    } catch (e) {
      rethrow;
    }
  }
}

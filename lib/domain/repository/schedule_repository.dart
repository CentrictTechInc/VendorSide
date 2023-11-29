import 'package:vendor_app/data/dto/schedule_dto.dart';

abstract class ScheduleRepository {
  Future<ScheduleDto> getSchedule();
  Future<String> updateSchedule({required ScheduleDto scheduleModel});
}

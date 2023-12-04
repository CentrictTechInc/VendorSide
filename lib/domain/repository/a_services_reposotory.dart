import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/domain/entity/a_servoces_model.dart';

abstract class AutoServiceRepository {
  Future<List<AutoServicesModel>> getAutoServices();
  Future<String> updateAutoServices(List<ServicePrice> data);
}

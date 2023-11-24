import 'package:vendor_app/domain/entity/services_model.dart';

abstract class ServiceRepository {
  Future<List<ServicesModel>> getAllServices();
}

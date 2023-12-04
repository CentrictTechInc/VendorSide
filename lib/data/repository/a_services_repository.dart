import 'dart:convert';

import 'package:vendor_app/data/dto/a_services_dto.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/provider/network/apis/a_services_api.dart';
import 'package:vendor_app/domain/entity/a_servoces_model.dart';
import 'package:vendor_app/domain/repository/a_services_reposotory.dart';

class AutoServiceRepositoryImp extends AutoServiceRepository {
  @override
  Future<String> updateAutoServices(List<ServicePrice> data) async {
    try {
      final response = await AutoServiceAPI.updateAutoServices(data).request();
      Map<String, dynamic> res = jsonDecode(response);
      return res['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AutoServicesModel>> getAutoServices() async {
    try {
      final response = await AutoServiceAPI.getAutoServices().request();
      List<dynamic> json = jsonDecode(response);
      List<AutoServicesModel> autoServices =
          json.map((data) => AutoServicesDto.fromJson(data)).toList();
      return autoServices;
    } catch (e) {
      rethrow;
    }
  }
}

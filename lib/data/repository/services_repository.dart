import 'dart:convert';

import 'package:vendor_app/data/dto/services_dto.dart';
import 'package:vendor_app/data/provider/network/apis/services_api.dart';
import 'package:vendor_app/domain/entity/services_model.dart';
import 'package:vendor_app/domain/repository/service_repository.dart';

class ServiceRepositoryImpl extends ServiceRepository {
  @override
  Future<List<ServicesModel>> getAllServices() async {
    try {
      final response = await ServiceAPI.getAllServices().request();
      List<dynamic> json = jsonDecode(response);
      List<ServicesModel> allServices =
          json.map((data) => ServicesDto.fromJson(data)).toList();
      return allServices;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List> getAmServices() async {
    try {
      final response = await ServiceAPI.getAllServices().request();
      List<dynamic> json = jsonDecode(response);
      List<ServicesModel> allServices =
          json.map((data) => ServicesDto.fromJson(data)).toList();
      return allServices;
    } catch (e) {
      rethrow;
    }
  }
}

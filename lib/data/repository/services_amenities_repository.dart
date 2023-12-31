import 'dart:convert';
import 'dart:io';

import 'package:vendor_app/data/dto/h_service_warranty_dto.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/dto/training_amenities_dto.dart';
import 'package:vendor_app/data/provider/network/apis/services_amenities_api.dart';
import 'package:vendor_app/domain/repository/services_amenities_repository.dart';

class ServicesAmenitiesRepositoryImpl extends ServicesAmenitiesRepository {
  @override
  Future<String> uploadTrainingAmenitiesForm(
      TrainingAmenitiesDto data, List<File> trainingAmenitiesImage) async {
    try {
      final res = await ServiceAmenitiesAPI.uploadTrainingAmenitiesForm(
              data, trainingAmenitiesImage)
          .request();
      Map<String, dynamic> result = jsonDecode(res);
      // return res;
      return result['message'].toString();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> servicePackagePricing(List<ServicePrice> data) async {
    try {
      final res =
          await ServiceAmenitiesAPI.servicePackagePricing(data).request();
      Map<String, dynamic> result = jsonDecode(res);
      return result['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> homeServicePriceUpdate(HomeImprovementServiceDto data) async {
    try {
      final res =
          await ServiceAmenitiesAPI.homeServicePriceUpdate(data).request();
      Map<String, dynamic> result = jsonDecode(res);
      return result['message'];
    } catch (e) {
      rethrow;
    }
  }
}

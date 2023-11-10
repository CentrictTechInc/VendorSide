import 'dart:convert';
import 'dart:io';

import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/dto/training_amenities_dto.dart';
import 'package:vendor_app/data/provider/network/apis/services_amenities_api.dart';
import 'package:vendor_app/domain/repository/services_amenities_repository.dart';

class ServicesAmenitiesRepositoryImpl extends ServicesAmenitiesRepository {
  @override
  Future<String> uploadTrainingAmenitiesForm(TrainingAmenitiesDto data,
      List<File> trainingAmenitiesImage, List<String> amenities) async {
    try {
      final res = await ServiceAmenitiesAPI.uploadTrainingAmenitiesForm(
              data, trainingAmenitiesImage, amenities)
          .request();
      print(res);
      Map<String, String> result = jsonDecode(res);
      // return res;
      return result['message'].toString();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> servicePackagePricing(ServicePricingDto data) async {
    final res = await ServiceAmenitiesAPI.servicePackagePricing(data).request();
    Map<String, dynamic> result = jsonDecode(res);
    return result['message'];
  }
}

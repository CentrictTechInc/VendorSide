import 'dart:io';

import 'package:vendor_app/data/dto/h_service_warranty_dto.dart';
import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/dto/training_amenities_dto.dart';

abstract class ServicesAmenitiesRepository {
  Future<String> uploadTrainingAmenitiesForm(TrainingAmenitiesDto data,
      List<File> trainingAmenitiesImage);

  Future<String> servicePackagePricing(List<ServicePrice> data);
  Future<String> homeServicePriceUpdate(HomeImprovementServiceDto data);
}

import 'dart:io';

import 'package:vendor_app/data/dto/service_pricing_dto.dart';
import 'package:vendor_app/data/dto/training_amenities_dto.dart';

abstract class ServicesAmenitiesRepository {
  Future<String> uploadTrainingAmenitiesForm(TrainingAmenitiesDto data,
      List<File> trainingAmenitiesImage, List<String> amenities);

  Future<String> servicePackagePricing(List<ServicePrice> data);
}

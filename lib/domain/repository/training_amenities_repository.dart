import 'dart:io';

import 'package:vendor_app/data/dto/training_amenities_dto.dart';

abstract class TrainingAmenitiesRepository {
  Future<String> uploadTrainingAmenitiesForm(
      TrainingAmenitiesDto data, List<File> trainingAmenitiesImage);
}

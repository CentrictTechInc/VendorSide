import 'dart:io';

import 'package:vendor_app/data/dto/training_amenities_dto.dart';
import 'package:vendor_app/domain/repository/training_amenities_repository.dart';

class TrainingAmenitiesRepositoryImpl extends TrainingAmenitiesRepository {
  @override
  Future<String> uploadTrainingAmenitiesForm(
      TrainingAmenitiesDto data, List<File> trainingAmenitiesImage) {
    throw UnimplementedError();
  }
}

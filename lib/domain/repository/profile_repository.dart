import 'dart:io';

import 'package:vendor_app/data/dto/user_details_dto.dart';
import 'package:vendor_app/domain/entity/user_details_model.dart';

abstract class ProfileRepository {
  Future<ProfileDetailsModel> getUserDetails(int userId);
  Future<String> postUserDetails(ProfileDetailsDto data, {File? userPic});
}

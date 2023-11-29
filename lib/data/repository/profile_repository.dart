import 'dart:convert';
import 'dart:io';

import 'package:vendor_app/data/dto/user_details_dto.dart';
import 'package:vendor_app/data/provider/network/apis/user_details_api.dart';
import 'package:vendor_app/domain/entity/user_details_model.dart';
import 'package:vendor_app/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<ProfileDetailsModel> getUserDetails(int userId) async {
    try {
      final response = await UserDetailAPI.getUserDetail(userId).request();
      ProfileDetailsModel userData = ProfileDetailsDto.fromRawJson(response);
      return userData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> postUserDetails(ProfileDetailsDto data,
      {File? userPic}) async {
    try {
      final response =
          await UserDetailAPI.postUserDetail(data, userPic).request();
      Map<String, dynamic> res = jsonDecode(response);
      return res['message'];
    } catch (e) {
      rethrow;
    }
  }
}

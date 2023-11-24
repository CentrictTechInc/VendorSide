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
  Future<String> postUserDetails(ProfileDetailsDto data) async {
    try {
      final response = await UserDetailAPI.postUserDetail(data).request();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

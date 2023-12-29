import 'dart:io';
import 'package:vendor_app/app/services/local_storage_service.dart';
import 'package:vendor_app/data/dto/user_details_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum UserAPIType { getUserDetail, updateUserDetail }

class UserDetailAPI implements APIRequestRepresentable {
  UserAPIType type;
  ProfileDetailsDto? data;
  File? profileImage;
  int? userId;
  UserDetailAPI._(
      {required this.type, this.data, this.userId, this.profileImage});
  UserDetailAPI.getUserDetail(userId)
      : this._(type: UserAPIType.getUserDetail, userId: userId);
  UserDetailAPI.postUserDetail(userdata, userPic)
      : this._(
            type: UserAPIType.updateUserDetail,
            data: userdata,
            profileImage: userPic);

  @override
  get body {
    switch (type) {
      case UserAPIType.updateUserDetail:
        return {
          "data": data?.toJson(),
          "PictureDataFile": profileImage,
        };
      case UserAPIType.getUserDetail:
        return {};
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    switch (type) {
      case UserAPIType.getUserDetail:
        return {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${LocalStorageService.instance.user?.token}'
        };
      case UserAPIType.updateUserDetail:
        return {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ${LocalStorageService.instance.user?.token}'
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case UserAPIType.getUserDetail:
        return HTTPMethod.get;
      case UserAPIType.updateUserDetail:
        return HTTPMethod.multiPartPut;
    }
  }

  @override
  String get path {
    switch (type) {
      case UserAPIType.updateUserDetail:
        return APIEndpoint.postProfileDetailsUrl;
      case UserAPIType.getUserDetail:
        return APIEndpoint.getProfileDetailsUrl;
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get urlParams {
    switch (type) {
      case UserAPIType.getUserDetail:
        return {'vendorId': userId.toString()};
      case UserAPIType.updateUserDetail:
        return {};
    }
  }
}

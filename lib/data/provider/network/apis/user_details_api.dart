import 'package:vendor_app/data/dto/user_details_dto.dart';
import 'package:vendor_app/data/provider/network/api_endpoints.dart';
import 'package:vendor_app/data/provider/network/api_provider.dart';
import 'package:vendor_app/data/provider/network/api_request_representable.dart';

enum UserAPIType { getUserDetail, postUserDetail }

class UserDetailAPI implements APIRequestRepresentable {
  UserAPIType type;
  UserDetailsDto? data;
  int? userId;
  UserDetailAPI._({required this.type, this.data, this.userId});
  UserDetailAPI.getUserDetail(userId)
      : this._(type: UserAPIType.getUserDetail, userId: userId);
  UserDetailAPI.postUserDetail(userdata)
      : this._(type: UserAPIType.postUserDetail, data: userdata);

  @override
  get body {
    switch (type) {
      case UserAPIType.postUserDetail:
        return data?.toRawJson();
      case UserAPIType.getUserDetail:
        return {};
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers => {
        "Content-Type": "application/json",
      };
  @override
  HTTPMethod get method {
    switch (type) {
      case UserAPIType.getUserDetail:
        return HTTPMethod.get;
      case UserAPIType.postUserDetail:
        return HTTPMethod.post;
    }
  }

  @override
  String get path {
    switch (type) {
      case UserAPIType.postUserDetail:
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
        return {'userid': userId.toString()};
      case UserAPIType.postUserDetail:
        return {};
    }
  }
}

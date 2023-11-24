import 'dart:convert';

import 'package:vendor_app/data/dto/user_dto.dart';
import 'package:vendor_app/domain/entity/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Key { user, fcmToken, pic }

class LocalStorageService {
  SharedPreferences? _prefs;

  static final _singleton = LocalStorageService();
  static LocalStorageService get instance => _singleton;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  UserModel? get user {
    final rawJson = _prefs?.getString(Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    return UserDto.fromRawJson(rawJson);
  }

  set user(UserModel? value) {
    if (value != null) {
      _prefs?.setString(Key.user.toString(), json.encode(value).toString());
    } else {
      _prefs?.remove(Key.user.toString());
    }
  }

  set userPicture(String? path) {
    if (path != null) {
      _prefs?.setString(Key.pic.name, path);
    } else {
      _prefs?.remove(Key.pic.name);
    }
  }

  String? get userPic {
    final pic = _prefs?.getString(Key.pic.name);
    if (pic == null) {
      return null;
    }
    return pic;
  }

  String? get fcmToken {
    final token = _prefs?.getString(Key.fcmToken.toString());
    if (token == null) {
      return null;
    }
    return token;
  }

  set fcmToken(String? token) {
    if (token != null) {
      _prefs?.setString(Key.fcmToken.toString(), token);
    } else {
      _prefs?.remove(Key.fcmToken.toString());
    }
  }

  logoutUser() async {
    await _prefs?.remove(Key.user.toString());
    await _prefs?.remove(Key.pic.name);
  }
}

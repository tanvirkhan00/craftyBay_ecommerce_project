import 'dart:convert';

import 'package:ecommerce_project/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const _tokenKey = "access-token";
  static const _userKey = "user-data";

  static UserModel? _userModel;
  static String? accessToken;

  static Future<void> saveUserData(String token, UserModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
    await preferences.setString(_userKey, jsonEncode(model.toJson()));
    accessToken = token;
    _userModel = model;
  }

  static Future<void> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    accessToken = preferences.getString(_tokenKey);
    if (accessToken != null) {
      final String? userData = preferences.getString(_userKey);
      if (userData != null) {
        _userModel = UserModel.fromJson(jsonDecode(userData));
      }
    }
  }

  static Future<bool> removeUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey) != null;
  }

  static Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}

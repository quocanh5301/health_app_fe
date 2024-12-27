import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:health_app_flutter/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? prefs;
  static String apiTokenKey = 'kAPITOKEN';
  static String refreshTokenKey = 'kREFRESHTOKEN';
  static String userInfoKey = 'kUSERINFO';

  static String isFirstTimeOpenApp = 'kFIRSTTIME';
  static String languageKey = 'kLANGUAGE';
  static String notificationSettingKey = 'kNOTIFICATIONSETTING';
  static String newNotificationKey = 'kNEWNOTIFICATION';

  static Future<bool> setIsFirstTime(
          bool isFirstTime) async => //1 is not first time
      await prefs!.setBool(isFirstTimeOpenApp, isFirstTime);

  static bool getIsFirstTime() => prefs!.getBool(isFirstTimeOpenApp) ?? true;

  static Future<bool> setUserInfo(User user) async =>
      await prefs!.setString(userInfoKey, jsonEncode(user.toJson()));

  static User getUserInfo() {
    String? userInfo = prefs!.getString(userInfoKey);
    if (userInfo != null) {
      try {
        return User.fromJson(jsonDecode(userInfo));
      } catch (e) {
        return const User();
      }
    } else {
      return const User();
    }
  }

  static Future<bool> setApiToken(String apiToken) async =>
      await prefs!.setString(apiTokenKey, apiToken);

  static String getApiToken() => prefs!.getString(apiTokenKey) ?? '';

  static Future<bool> setRefreshToken(String refreshToken) async =>
      await prefs!.setString(refreshTokenKey, refreshToken);

  static String getRefreshToken() => prefs!.getString(refreshTokenKey) ?? '';

  static void setLanguage(String languageCode) async =>
      await prefs!.setString(languageKey, languageCode);

  static String getLanguage() => prefs!.getString(languageKey) ?? "vi";

//--------------------------------//!qa notification feature implement here
  static Future<bool> setNotificationSetting(bool notificationOn) async {
    return prefs!.setBool(notificationSettingKey, notificationOn);
  }

  static Future<bool> getNotificationSetting() async {
    //!this function usually called from THE background (notification in background)
    prefs ?? (prefs = await SharedPreferences.getInstance());
    return prefs!.getBool(notificationSettingKey) ?? false;
  }

  static Future<bool> setNewNotificationAlert(bool haveNewNoti) async {
    //!qa
    debugPrint('set new notification alert $haveNewNoti');
    prefs ?? (prefs = await SharedPreferences.getInstance());
    return await prefs!.setBool(newNotificationKey, haveNewNoti);
  }

  static Future<bool> getNewNotificationAlert() async {
    //!qa
    prefs ?? (prefs = await SharedPreferences.getInstance());
    debugPrint(
        'get new notification alert 2 ${prefs!.getBool(newNotificationKey)}');
    return prefs!.getBool(newNotificationKey) ?? false;
  }
}

import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_cat_home/model/language.dart';
import 'package:stray_cat_home/model/request_register.dart';
import 'package:stray_cat_home/util/sp_key.dart';

/// @description :键值对存储
class SpUtil {


  ///更新用户信息，需要保存密码
  ///[userInfo] 用户信息
  static notifyUserInfo(UserEntity userInfo){
    var oldInfo = getUserInfo();
    if(oldInfo != null){
      userInfo.password = oldInfo.password;
    }
    SpUtil.deleteUserInfo();
    SpUtil.putUserInfo(userInfo);
  }

  ///删除存储用户信息
  static deleteUserInfo() {
    Get.find<SharedPreferences>().remove(SPKey.keyUserInfo);
  }

  ///存储用户信息
  ///[userInfo] 用户信息
  static putUserInfo(UserEntity userInfo) {
    debugPrint("保存用户信息成功");
    Get.find<SharedPreferences>()
        .setString(SPKey.keyUserInfo, jsonEncode(userInfo.toJson()));
  }

  ///获取用户信息
  ///[UserEntity] 用户信息
  static UserEntity? getUserInfo() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(SPKey.keyUserInfo);
      if (json == null) {
        return null;
      } else {
        return UserEntity.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  ///存储语言
  ///[Language] 语言
  static updateLanguage(Language language) {
    Get.find<SharedPreferences>().remove(SPKey.language);
    Get.find<SharedPreferences>()
        .setString(SPKey.language, jsonEncode(language.toJson()));
  }

  ///获取语言选项
  ///[Language] 语言
  static Language? getLanguage() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(SPKey.language);
      if (json == null) {
        return null;
      } else {
        return Language.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

}

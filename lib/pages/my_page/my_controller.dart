
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/getx_controller_inject.dart';
import 'package:stray_cat_home/model/request_register.dart';
import 'package:stray_cat_home/util/sp_util.dart';

/// @class : MyController
/// @date : 2021/08/20
/// @name : jhf
/// @description :我的 控制器层
class MyController extends BaseGetController {
  ///用户信息
  late UserEntity userInfo;
  ///账号
  String username = "";

  ///头像
  String avatar = "";

  ///浏览历史长度
  RxInt browseHistory = 0.obs;
  ///分享的长度
  RxInt share = 0.obs;

  @override
  void onInit() {
    super.onInit();
    var info = SpUtil.getUserInfo();
    debugPrint("开始获取用户信息");
    notifyUserInfo();
    if (info != null) {
      debugPrint("我的页面运行");
      userInfo = info;
      update();
    }
  }

  /// 更新用户信息，每次进入时更新
  void notifyUserInfo() {
    debugPrint("开始获取用户信息");
    var info = SpUtil.getUserInfo();
    var UpdateUserName = info?.username;
    username=UpdateUserName.toString();

    debugPrint("获取用户名>>>$username");
    request.getUserInfo(username,success: (data) {
      debugPrint("发送成功");
      userInfo = data;
      SpUtil.notifyUserInfo(userInfo);
      update();
    });
  }

  // /// 刷新分享的文章数据
  // void notifyShareArticle() {
  //   request.requestShareArticleList(1 , length: (size) {
  //     share.value = size;
  //   });
  // }

  // ///更新历史记录长度
  // void notifyBrowseHistory() {
  //   browseHistory.value = SpUtil.getBrowseHistoryLength();
  // }
}

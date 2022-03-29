
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/getx_controller_inject.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/routers/routes.dart';
import 'package:stray_cat_home/util/cache_util.dart';
import 'package:stray_cat_home/util/sp_util.dart';
import 'package:stray_cat_home/util/totast_util.dart';

/// @class : SettingController
/// @date : 2021/08/25
/// @name : jhf
/// @description :设置 控制器层
class SettingController extends BaseGetController {

  ///缓存大小
  var cache = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCache();
  }

  ///加载缓存
  loadCache(){
    CacheUtil.loadCache().then((value) {
      cache.value = CacheUtil.byte2FitMemorySize(value);
    });
  }

  ///清除缓存
  clearCacheFile() {
    CacheUtil.clearCache().then((value) {
      loadCache();
      ToastUtils.show(value ? StringStyles.settingCacheSuccess.tr : StringStyles
          .settingCacheFail.tr);
    });
  }


  ///退出登录
  exitLoginState(){
    SpUtil.deleteUserInfo();
    //request.exitLogin();
    Get.offAllNamed(Routes.loginPage);
  }


}

import 'package:get/get.dart';
import 'package:stray_cat_home/util/sp_util.dart';

import 'splash_controller.dart';


/// @description :启动页 binding层
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    //SpUtil.deleteUserInfo();
    Get.lazyPut(() => SplashController());
  }
}

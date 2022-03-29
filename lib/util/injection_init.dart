import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_cat_home/http/request_repository.dart';

/// @name : jhf
/// @description :初始化时进行依赖注入，可全局使用
class Injection{

  static Future<void> init() async {
    // shared_preferences
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.lazyPut(() =>RequestRepository());
  }
}
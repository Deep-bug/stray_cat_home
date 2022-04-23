import 'package:get/get.dart';

import 'login_controller.dart';



/// @name : lairenlong
/// @description :启动页 binding层
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

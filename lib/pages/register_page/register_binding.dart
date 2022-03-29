
import 'package:get/get.dart';
import 'package:stray_cat_home/pages/register_page/register_controller.dart';


/// @class : RegisterBinding
/// @date : 2021/08/16
/// @name : jhf
/// @description :启动页 binding层
class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}

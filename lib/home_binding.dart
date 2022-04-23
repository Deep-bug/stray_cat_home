
import 'package:get/get.dart';
import 'package:stray_cat_home/pages/cat_family_page/catInfo_controller.dart';
import 'package:stray_cat_home/pages/my_page/my_controller.dart';


/// @class : HomeBinding
/// @date : 2021/08/20
/// @name : jhf
/// @description :首页 binding层
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    ///图鉴层
    Get.lazyPut(() =>CatInfoController());
    //Get.lazyPut(() =>CatInfoV2Controller());

    // Get.lazyPut(() => ProjectController());
    // Get.lazyPut(() => ComplexController());
    // Get.lazyPut(() => AskController());
    // Get.lazyPut(() => MainController());
    ///用户设置及其展示页面层
     Get.lazyPut(() => MyController());
    // Get.lazyPut(() => SquareController());
  }
}

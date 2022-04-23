import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:stray_cat_home/pages/cat_family_page/catInfo_controller.dart';
import 'package:stray_cat_home/pages/my_page/my_controller.dart';

class HomePageV2Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>CatInfoController());
    Get.lazyPut(() => MyController());
  }


}
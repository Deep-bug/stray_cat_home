import 'package:get/get.dart';
import 'package:stray_cat_home/pages/cat_map_page/catmap_controller.dart';

class CatMapBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CatMapController());
  }

}
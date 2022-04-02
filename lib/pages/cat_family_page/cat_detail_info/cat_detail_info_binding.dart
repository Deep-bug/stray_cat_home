import 'package:get/get.dart';
import 'package:stray_cat_home/pages/cat_family_page/cat_detail_info/cat_Info_detail_controller.dart';

class CatInfoDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CatInfoDetailController());
  }

}
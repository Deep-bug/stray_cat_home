import 'package:get/get.dart';
import 'package:stray_cat_home/pages/community_page/push_page/push_controller.dart';



class PushBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PushController());
  }
}

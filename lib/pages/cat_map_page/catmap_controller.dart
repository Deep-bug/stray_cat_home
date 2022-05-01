import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:stray_cat_home/base/get/getx_controller_inject.dart';

class CatMapController extends BaseGetController{
  ///进度条
  var progress = 0.0.obs;


  @override
  void onInit() {
    super.onInit();

  }
}
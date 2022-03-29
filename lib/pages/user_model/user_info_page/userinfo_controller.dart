
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/getx_controller_inject.dart';
import 'package:stray_cat_home/model/request_register.dart';
import 'package:stray_cat_home/util/sp_util.dart';


/// @class : UserInfoController
/// @date : 2021/08/24
/// @name : jhf
/// @description :用户信息 控制器层
class UserInfoController extends BaseGetController {

  ///用户信息
  late UserEntity userInfo;

  @override
  void onInit() {
    super.onInit();
    var info = SpUtil.getUserInfo();
    if(info != null){
      userInfo = info;
      update();
    }
  }


}

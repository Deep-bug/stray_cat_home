
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/getx_controller_inject.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/routers/routes.dart';
import 'package:stray_cat_home/util/totast_util.dart';



/// @class : SplashController
/// @date : 2021/08/15
/// @name : jhf
/// @description :启动页 控制器层
class LoginController extends BaseGetController {


  ///账号
  String username = "";
  ///密码
  String password = "";



  ///当前按钮是否可点击
  bool changeShowButton(){
    return username.isNotEmpty &&
        password.isNotEmpty;
  }

  ///用户登录
  login() {
    if (username.isEmpty ||
        password.isEmpty) {
      return;
    }

    ///账户名：>6位
    if (username.isEmpty || username.length < 6) {
      ToastUtils.show(username.isEmpty
          ? StringStyles.registerAccountEmpty.tr
          : StringStyles.registerAccountLength.tr);
      return;
    }

    ///密码：>6位
    if (password.isEmpty || password.length < 6) {
      ToastUtils.show(password.isEmpty
          ? StringStyles.registerPasswordEmpty.tr
          : StringStyles.registerPasswordLength.tr);
      return;
    }


    request.login(username, password, success: (data) {
      ToastUtils.show(StringStyles.loginSuccess.tr);
      Get.offAllNamed(Routes.homePageV2);
    });
  }


}

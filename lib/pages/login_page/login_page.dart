import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/get_common_view.dart';
import 'package:stray_cat_home/pages/login_page/widget/edit_widget.dart';
import 'package:stray_cat_home/res/button_style.dart';
import 'package:stray_cat_home/res/colors.dart';
import 'package:stray_cat_home/res/r.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/routers/routes.dart';
import 'package:stray_cat_home/util/keyboard_util.dart';

import 'login_controller.dart';

/// @class : LoginPage
/// @date : 2021/08/17
/// @name : jhf
/// @description :登录 View层
class LoginPage extends GetCommonView<LoginController> {
  const   LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.only(left: 35, top: 42, right: 35),

          width: double.infinity,
          height: double.infinity,
          // color: Colors.green,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(R.assetsImagesLoginBackground),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 50,
                height: 50,
              ),
              const Text(
                "用户登录",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Text("欢迎关注校园流浪猫平台",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 60,
                height: 65,
              ),
              // ToolBar(
              //   backColor: Colors.white,
              //   backgroundColor: Colors.transparent,
              // ),

              //logo及app名称
             // const LogoNameWidget(),

              ///账户名输入框
              EditWidget(
                iconWidget: const Icon(
                  Icons.perm_identity,
                  color: Colors.black,
                ),
                hintText: StringStyles.loginAccountNameHint.tr,
                onChanged: (text) => controller
                  ..username = text
                  ..update(),
              ),

              ///密码输入框
              EditWidget(
                iconWidget: const Icon(Icons.lock_open, color: Colors.black),
                hintText: StringStyles.loginAccountPwdHint.tr,
                passwordType: true,
                onChanged: (text) => controller
                  ..password = text
                  ..update(),
              ),


              ///登录按钮
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 36, left: 25, right: 25),
                child: TextButton(
                    style: controller.changeShowButton()
                        ? ButtonStyles.getButtonStyle()
                        : ButtonStyles.getTransparentStyle(),
                    onPressed: () {
                      KeyboardUtils.hideKeyboard(context);
                      controller.login();
                    },
                    child: Text(
                      StringStyles.loginButton.tr,
                      style: controller.changeShowButton()
                          ? Styles.style_white_18
                          : Styles.style_white24_18,
                    )),
                decoration: BoxDecoration(
                  color: controller.changeShowButton()
                      ? ColorStyle.color_24CF5F
                      : ColorStyle.color_24CF5F_20,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
              ),

              ///注册按钮
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
                child: TextButton(
                    style: ButtonStyles.getButtonStyle(),
                    onPressed: () {
                      KeyboardUtils.hideKeyboard(context);
                      Get.toNamed(Routes.registerPage);
                    },
                    child: Text(
                      StringStyles.registerButton.tr,
                      style: Styles.style_black_18_bold500,
                    )),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.white, width: 1),
                ),
              )
            ],
          ),
        ));
  }
}

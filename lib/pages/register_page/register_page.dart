
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/get_common_view.dart';
import 'package:stray_cat_home/pages/login_page/widget/edit_widget.dart';
import 'package:stray_cat_home/pages/register_page/register_controller.dart';
import 'package:stray_cat_home/res/button_style.dart';
import 'package:stray_cat_home/res/colors.dart';
import 'package:stray_cat_home/res/r.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/util/keyboard_util.dart';


/// @description :注册 View层
class RegisterPage extends GetCommonView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(R.assetsImagesRegister),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    width: 50,
                    height: 100,
                  ),
                  const Text(
                    "新用户注册",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  const Text("非常感谢你对校园流浪猫的关注",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                    height:20,
                  ),

                  ///账户名输入框
                  EditWidget(
                    iconWidget: const Icon(
                      Icons.perm_identity,
                      color: Colors.green,
                    ),
                    hintText: StringStyles.loginAccountNameHint.tr,
                    onChanged: (text) => controller
                      ..username = text
                      ..update(),
                  ),

                  ///密码输入框
                  EditWidget(
                    iconWidget:
                        const Icon(Icons.lock_open, color: Colors.green),
                    hintText: StringStyles.loginAccountPwdHint.tr,
                    passwordType: true,
                    onChanged: (text) => controller
                      ..password = text
                      ..update(),
                  ),

                  ///再次输入密码输入框
                  EditWidget(
                    iconWidget:
                        const Icon(Icons.lock_open, color: Colors.green),
                    hintText: StringStyles.loginAccountRePwdHint.tr,
                    passwordType: true,
                    onChanged: (text) => controller
                      ..rePassword = text
                      ..update(),
                  ),

                  // ///用户服务条款
                  // const RegisterPrivacyWidget(),

                  ///注册按钮
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
                    child: TextButton(
                        style: controller.changeShowButton()
                            ? ButtonStyles.getButtonStyle()
                            : ButtonStyles.getTransparentStyle(),
                        onPressed: () {
                          KeyboardUtils.hideKeyboard(context);
                          controller.register();
                        },
                        child: Text(
                          StringStyles.registerButton.tr,
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
                ],
              ),
            )));
  }
}

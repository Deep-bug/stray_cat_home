
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/get_common_view.dart';
import 'package:stray_cat_home/pages/my_page/widget/head_circle_widget.dart';
import 'package:stray_cat_home/pages/user_model/user_info_page/userinfo_controller.dart';
import 'package:stray_cat_home/pages/user_model/user_info_page/widget/user_info_widget.dart';
import 'package:stray_cat_home/res/shadow_style.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/widget/_toolbar.dart';

/// @class : WebViewPage
/// @date : 2021/08/24
/// @name : jhf
/// @description :用户信息 View层
class UserInfoPage extends GetCommonView<UserInfoController> {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            ToolBar(
              title: StringStyles.homeUserInfo.tr,
              backOnTap: () => Get.back()
            ),

            ///头像
            Container(
              margin: const EdgeInsets.only(top: 24),
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:Container(
                  width: 72,
                  height: 72,
                  color: Colors.white,
                  child: FadeInImage.assetNetwork(
                    image: controller.userInfo.avatar.toString(),
                    placeholder: 'asserts/images/loadingPicture.jpeg',
                    fit: BoxFit.cover,
                  ),
                ) ,
              ),
              decoration: ShadowStyle.black12Circle40(),
            ),
            Box.vBox20,

            UserInfoWidget(
              keys: StringStyles.userNickname.tr,
              value: controller.userInfo.nickname,
            ),

            DividerStyle.divider1HalfPadding20,


          ],
        ),
      ),
    );
  }
}

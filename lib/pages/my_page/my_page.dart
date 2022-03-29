import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/get_save_state_view.dart';
import 'package:stray_cat_home/pages/my_page/widget/head_circle_widget.dart';
import 'package:stray_cat_home/pages/my_page/widget/title_content_widget.dart';
import 'package:stray_cat_home/res/colors.dart';
import 'package:stray_cat_home/res/constant.dart';
import 'package:stray_cat_home/res/r.dart';
import 'package:stray_cat_home/res/shadow_style.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/routers/routes.dart';
import 'package:stray_cat_home/ui/dialog/dialog_share_appliction.dart';
import 'package:stray_cat_home/widget/icon_text_widget.dart';

import 'my_controller.dart';

/// @class : MyPage
/// @date : 2021/08/20
/// @name : jhf
/// @description :我的 View层
class MyPage extends GetSaveView<MyController> {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: kTextTabBarHeight + 6),
      child: Column(
        children: [
          Row(
            children: [
              ///头像
              GestureDetector(
                onTap: () => Get.toNamed(Routes.userInfoPage),
                child: Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 72,
                      height: 72,
                      color: Colors.white,
                      child: FadeInImage.assetNetwork(
                        image: controller.userInfo.avatar.toString(),
                        placeholder: 'asserts/images/loadingPicture.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  decoration: ShadowStyle.black12Circle40(),
                ),
              ),

              ///用户名称
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(
                  controller.userInfo.nickname,
                  style: Styles.style_1A2F51_18,
                ),
              ),

              ///占位
              const Expanded(
                child: Text(''), // 中间用Expanded控件
              ),

              ///设置
              GestureDetector(
                onTap: () => Get.toNamed(Routes.settingPage),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Container(
                    color: ColorStyle.color_F3F3F3,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: const Icon(Icons.settings),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
            decoration: ShadowStyle.white12Circle(),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              direction: Axis.horizontal,
              children: [
                ///收藏数量
                Expanded(
                  flex: 1,
                  child: TitleContentWidget(
                    title: StringStyles.homeCollect.tr,
                    content: '0',
                    // onTap: () => Get.toNamed(Routes.collectPage),
                  ),
                ),

                ///分享列表
                Expanded(
                  flex: 1,
                  child: Obx(() => TitleContentWidget(
                        title: StringStyles.homeProject.tr,
                        content: '${controller.share}',
                        //onTap: () => Get.toNamed(Routes.sharePage),
                      )),
                ),

                ///
                Expanded(
                  flex: 1,
                  child: TitleContentWidget(
                    title: StringStyles.homePoints.tr,
                    content: '0',
                    // content: controller.userInfo.coinCount.toString(),
                    // onTap: () => Get.toNamed(Routes.pointsPage),
                  ),
                ),

                // ///历史
                // Expanded(
                //     flex: 1,
                //     child: Obx(() => TitleContentWidget(
                //       title: StringStyles.homeHistory.tr,
                //       content: '${controller.browseHistory.value}',
                //       onTap: () => Get.toNamed(Routes.historyPage),
                //     ))),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
            decoration: ShadowStyle.white12Circle(),
            child: Column(children: [
              ///个人信息
              IconTitleWidget(
                icon: Icons.perm_identity,
                text: StringStyles.homeUserInfo.tr,
                endColor: Colors.black54,
                onTap: () => Get.toNamed(Routes.userInfoPage),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

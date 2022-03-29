
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stray_cat_home/base/get/get_common_view.dart';
import 'package:stray_cat_home/pages/setting_page/setting_controller.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/routers/routes.dart';
import 'package:stray_cat_home/widget/_toolbar.dart';

/// @class : SettingPage
/// @date : 2021/08/25
/// @name : jhf
/// @description :设置 View层
class SettingPage extends GetCommonView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            ToolBar(
              title: StringStyles.settingTitle.tr,
            ),
            DividerStyle.divider1Half,
            ListTile(
              onTap: () => Get.toNamed(Routes.settingLanguagePage),
              title: Text(StringStyles.settingLanguage.tr),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),

            ListTile(
              onTap: () => controller.clearCacheFile(),
              title: Text(StringStyles.settingCache.tr),
              trailing:Obx(() => Text(
                  controller.cache.value,
                style: Styles.style_6A6969_14,
              )),
            ),

            DividerStyle.divider20Half,

            ListTile(
              onTap: () => controller.exitLoginState(),
              title: Container(
                alignment: Alignment.center,
                child: Text(StringStyles.settingExitLogin.tr),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

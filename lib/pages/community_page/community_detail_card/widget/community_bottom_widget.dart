
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stray_cat_home/base/get/get_common_view.dart';
import 'package:stray_cat_home/pages/community_page/community_controller.dart';
import 'package:stray_cat_home/res/colors.dart';
import 'package:stray_cat_home/res/shadow_style.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/util/totast_util.dart';

/// @class : WebViewBottomWidget
/// @date : 2021/08/25
/// @name : jhf
/// @description :WebView 底部菜单
class CommunityBottomWidget extends GetCommonView<CommunityController> {
  const CommunityBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Box.hBox20,
          Expanded(
              child: GestureDetector(
            onTap: () => ToastUtils.show(StringStyles.webNotComment.tr),
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  StringStyles.webEditHint.tr,
                  style: Styles.style_B8C0D4_14,
                ),
                decoration: const BoxDecoration(
                  color: ColorStyle.colorShadow,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )),
          )),
          Box.hBox20,
          InkWell(
           //onTap: () => controller.collectArticle(),
           //  child: Obx(() => SvgPicture.asset(
           //   controller.isCollect.value ? R.assetsImagesCollect : R.assetsImagesCollectQuit,
           //    width: 24,
           //  )),
          ),
          Box.hBox20,
          InkWell(
            onTap: ()=> ToastUtils.show(StringStyles.notSupportLikes.tr),
            child: const Icon(
            Icons.thumb_up_alt_outlined,
            color: ColorStyle.color_24CF5F,
            size: 24,
          )),
          Box.hBox20,
          InkWell(
          //  onTap: () => Navigate.launchInBrowser(controller.detail.link),
            child: const Icon(
              Icons.public,
              color: Colors.blue,
              size: 24,
            ),
          ),
          Box.hBox20,
        ],
      ),
      decoration: ShadowStyle.white12Circle(radius: 5),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:stray_cat_home/base/get/get_common_view.dart';
import 'package:stray_cat_home/base/get/get_save_state_view.dart';
import 'package:stray_cat_home/pages/cat_map_page/catmap_controller.dart';
import 'package:stray_cat_home/res/colors.dart';
import 'package:stray_cat_home/res/r.dart';
import 'package:stray_cat_home/util/navigate_util.dart';
import 'package:stray_cat_home/widget/_toolbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CatHomeMap extends GetSaveView<CatMapController> {
  const CatHomeMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          /// 拦截用户返回，返回时携带参数
          Get.back(result: controller);
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Stack(
                children: [
                  AppBar(
                    backgroundColor:ColorStyle.color_24CF5F,
                    title: Text('猫咪地图',
                        style: TextStyle(color: Colors.white,
                            fontSize:25)

                      ),

                  ),
                  // Positioned(
                  //
                  //   child: Material(
                  //     color: Colors.transparent,
                  //     child: InkWell(
                  //       borderRadius: const BorderRadius.all(
                  //         Radius.circular(20),
                  //       ),
                  //       splashColor: ColorStyle.color_E2E3E8_66,
                  //       child:  SvgPicture.asset(
                  //         R.assetsImagesShare,
                  //         width: 16,
                  //         height: 16,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    WebView(
                      //https://www.amap.com/
                      //initialUrl:'https://www.amap.com/',
                      initialUrl:'http://101.132.45.190/catmap',
                      javascriptMode: JavascriptMode.unrestricted,
                      onProgress: (pro) {
                        controller.progress.value = (pro / 100).toDouble();
                      },
                    ),

                    Obx(() => Visibility(
                      visible: controller.progress < 1,
                      child: LinearProgressIndicator(
                        minHeight: 2,
                        backgroundColor: ColorStyle.color_F9F9F9,
                        color: ColorStyle.color_24CF5F,
                        value: controller.progress.value,
                      ),
                    )),
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}

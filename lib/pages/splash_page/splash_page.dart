
import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/splash_page/widget/splash_anim_widget.dart';
import 'package:stray_cat_home/res/r.dart';
import 'package:stray_cat_home/util/screen_util.dart';

/// @class : SplashPage
/// @date : 2021/08/15
/// @name : jhf
/// @description :启动页 View层
class SplashPage extends StatelessWidget {

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.removeSystemTransparent(context);
    ///预缓存背景图片
    precacheImage(const AssetImage(R.assetsImagesLoginBackground), context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashAnimWidget()
    );
  }



}
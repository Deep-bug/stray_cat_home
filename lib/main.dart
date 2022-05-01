import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
// import 'package:stray_cat_home/homeIndexPage.dart';
import 'package:stray_cat_home/pages/splash_page/splash_binding.dart';
import 'package:stray_cat_home/pages/splash_page/splash_page.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/routers/routes.dart';
import 'package:stray_cat_home/util/injection_init.dart';
import 'package:stray_cat_home/util/keyboard_util.dart';
import 'package:stray_cat_home/routers/routes.dart';
import 'package:stray_cat_home/util/locale_util.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp( GetMaterialApp(
    getPages: Routes.routePage,
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    builder: (context, child) => Scaffold(
      // Global GestureDetector that will dismiss the keyboard
      body: GestureDetector(
        onTap: () {
          KeyboardUtils.hideKeyboard(context);
        },
        child: child,
      ),
    ),
    // ///主题颜色
    // theme: appThemeData,
    ///国际化支持-来源配置
    translations: Messages(),
    ///国际化支持-默认语言
    locale: LocaleOptions.getDefault(),
    ///国际化支持-备用语言
    fallbackLocale: const Locale('en', 'US'),

    defaultTransition: Transition.fade,
    initialBinding: SplashBinding(),
     home:  const SplashPage(),
    //home:  const HomeIndexPage(),

  ));

  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle =
  //   SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
}


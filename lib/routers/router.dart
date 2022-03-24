import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:stray_cat_home/routers/route_handler.dart';

import '../home.dart';
class SCHRoutes {
  static String root="/";
  static String home="/home";
  static String test="/test";
  static String homeindexpage="/HomeIndexPage";
  static String loginindex="/loginIndex";
  static String userIndex="/userIndex";

    // '/':(context)=>const Home(),
    //   //   '/login_page':(context)=>const login(),
    //   //   '/HomeIndexPage':(context)=>const HomeIndexPage(),
    //   //   '/my':(context)=>const usertest(),
    //   //   '/test':(context)=>const testpage(),
    //   // },

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler=Handler(
        handlerFunc: (BuildContext? context,Map<String,List<String>> params){
          print("无法找到对应路由");
        });
     ///测试页
     router.define(test,handler: guideHandler);
     ///开发者页面
     router.define(home,handler:rootHandler );
     ///登录页
     router.define(loginindex, handler: loginHandler);
     ///应用首页
     router.define(homeindexpage, handler: homeindexHandler);
     ///用户首页
     router.define(userIndex, handler: userindexHandler);
  }
}
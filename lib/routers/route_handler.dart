import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:stray_cat_home/homeIndexPage.dart';
import 'package:stray_cat_home/pages/login_page/login.dart';
import 'package:stray_cat_home/pages/user_page/user_index_page.dart';
import 'package:stray_cat_home/test_page/test_route.dart';

import '../home.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Home();
});
Handler guideHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return testpage();
});
Handler loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return login();
});
Handler homeindexHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomeIndexPage();
});
Handler userindexHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return userIndex();
});

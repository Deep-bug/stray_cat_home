import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stray_cat_home/routers/application.dart';
import 'package:stray_cat_home/routers/router.dart';
import 'dart:io';

import 'app.dart';

void main() {
  ///注册路由
  final router=FluroRouter();
  SCHRoutes.configureRoutes(router);
  SCHApplication.router=router;
  runApp( SCHApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


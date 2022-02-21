import 'package:flutter/material.dart';
import 'package:stray_cat_home/home.dart';
import 'package:stray_cat_home/homeIndexPage.dart';
import 'package:stray_cat_home/page/login_page/login.dart';
import 'package:stray_cat_home/page/user_page/usertest.dart';
import 'package:stray_cat_home/util/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '它的家',
      theme: ThemeData(
        primarySwatch: primary,
      ),
      routes: {
        '/':(context)=>const Home(),
        '/login_page':(context)=>const login(),
        '/HomeIndexPage':(context)=>const HomeIndexPage(),
        '/my':(context)=>const usertest(),
      },
    );
  }
}

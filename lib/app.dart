// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:stray_cat_home/routers/application.dart';
// import 'package:stray_cat_home/util/theme.dart';
//
// import 'home.dart';
//
// class SCHApp extends StatelessWidget {
//    SCHApp({Key? key}) : super(key: key){
//     _initEasyLoading();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//         designSize: const Size(750, 1334),
//         builder: () => buildApp(context));
//   }
//
//   Widget buildApp(BuildContext context) {
//     return MaterialApp(
//       title: '它的家',
//       theme: Theme.of(context).copyWith(
//           appBarTheme: Theme.of(context).appBarTheme.copyWith(
//             color: primary,
//             elevation: 0,
//             brightness: Brightness.dark,
//           )),
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//       onGenerateRoute: SCHApplication.router?.generator,
//       builder: EasyLoading.init(),
//     );
//   }
//
//   _initEasyLoading() {
//     EasyLoading.instance
//       ..displayDuration = const Duration(milliseconds: 2000)
//       ..indicatorType = EasyLoadingIndicatorType.rotatingCircle
//       ..loadingStyle = EasyLoadingStyle.dark
//       ..fontSize = 16.0
//       ..indicatorSize = 32.0
//       ..radius = 10.0
//       ..progressColor = Colors.yellow
//       ..backgroundColor = Colors.green
//       ..indicatorColor = Colors.yellow
//       ..textColor = Colors.yellow
//       ..maskColor = Colors.blue.withOpacity(0.5)
//       ..userInteractions = true
//       ..dismissOnTap = false;
//   }
// }

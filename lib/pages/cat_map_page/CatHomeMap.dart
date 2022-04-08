import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/util/navigate_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CatHomeMap extends StatelessWidget {
  const CatHomeMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url="https://ditu.amap.com";
    return Scaffold(
      body: WebView(
        initialUrl: url,
        javascriptMode:  JavascriptMode.unrestricted,

      )
    );
  }
}

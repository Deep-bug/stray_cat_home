import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/cat_family_page/widget/cat_Info_appBar.dart';
import 'package:stray_cat_home/pages/cat_family_page/widget/cat_item.dart';
import 'package:stray_cat_home/pages/cat_family_page/widget/cat_view.dart';
import 'package:stray_cat_home/pages/cat_family_page/widget/page_title_list.dart';
import 'package:stray_cat_home/pages/user_page/widget/AppBarTabsItem.dart';
import 'package:stray_cat_home/res/colors.dart';

class catInfo extends StatefulWidget {
  const catInfo({Key? key}) : super(key: key);

  @override
  _catInfoState createState() => _catInfoState();
}

class _catInfoState extends State<catInfo> {
  @override
  Widget build(BuildContext context) {
    //取得当前屏幕的大小
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("猛兽图鉴"),
          backgroundColor: ColorStyle.color_24CF5F,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             // const PageListTitle(),
             //  const SizedBox(
             //    height: 12,
             //  ),
              CatGridView(size: size),
            ])
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: const <Widget>[
        //     SizedBox(
        //       height: 20,
        //     ),
        //     // ProductGridView(size: size)
        //
        //   ],
        // ),
        );
  }

  //头部栏
  AppBar infotestwidget() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: 100,
      title: const Text(
        '猛兽图鉴',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleSpacing: 20,
    );
  }
}

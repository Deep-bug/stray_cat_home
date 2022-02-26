import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/cat_family_page/widget/cat_Info_appBar.dart';
import 'package:stray_cat_home/pages/cat_family_page/widget/page_title_list.dart';
import 'package:stray_cat_home/pages/user_page/widget/AppBarTabsItem.dart';

class catInfo extends StatefulWidget {
  const catInfo({Key? key}) : super(key: key);

  @override
  _catInfoState createState() => _catInfoState();
}

class _catInfoState extends State<catInfo> {
// 默认选中的tab 0开始
  int _currentTab = 1;
// tabs item
  Widget buildAppBarTabsItem(String text, int index) {

    return AppBarTabsItem(
      text: text,
      active: _currentTab == index,
      onTap: () {
        setState(() {
          _currentTab = index;
        });
      },
    );
  }
  // tabs 容器
  Widget buildAppBarTabs() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildAppBarTabsItem('上班中', 0),
        buildAppBarTabsItem('已领养', 1),
        buildAppBarTabsItem('生病中', 2),
        buildAppBarTabsItem('回喵星', 3),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //取得当前屏幕的大小
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children:   <Widget>[
              // Row(
              //     children: <Widget>[
              //       const PageTitleName(),
              //       TextField(
              //         /// 设置字体
              //         style: const TextStyle(),
              //
              //         /// 设置输入框样式
              //         decoration: InputDecoration(
              //           hintText: '请输入你想寻找的内容',
              //           /// 边框
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(35),
              //             borderSide: BorderSide.none,
              //           ),
              //           fillColor: Colors.grey[200],
              //           // 是否使用填充色
              //           filled: false,
              //           // ///设置内容内边距
              //           // contentPadding:
              //           // const EdgeInsets.symmetric(vertical: 4.0),
              //           /// 前缀图标
              //           prefixIcon: const Icon(Icons.search),
              //         ),
              //       ),
              //     ],
              //  ),
          PageTitleName(),
              SizedBox(
                height: 10,
              ),
              PageListTitle(),
            ]
        )
    );
  }

}

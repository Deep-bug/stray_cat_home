// tabs item
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/user_page/widget/AppBarTabsItem.dart';
class CommunityAppBar extends StatefulWidget {
  const CommunityAppBar({Key? key}) : super(key: key);

  @override
  _CommunityAppBarState createState() => _CommunityAppBarState();
}

class _CommunityAppBarState extends State<CommunityAppBar> {
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
    return AppBar(
      // 阴影
      elevation: 0,
      //backgroundColor: Colors.white,
      backgroundColor: Colors.white,
      centerTitle: true,
      // title widget两边不留间隙
      // Defaults to [NavigationToolbar.kMiddleSpacing].
      // titleSpacing: 0.0,
      title: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [],
            ),
            const Positioned(
              left: 0,
              child: Icon(
                Icons.alternate_email,
                color: Colors.black,
              ),
            ),
            buildAppBarTabs(),
          ],
        ),
      ),
    );
  }
}

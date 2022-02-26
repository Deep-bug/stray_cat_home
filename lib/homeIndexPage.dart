import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/community_page/widget/community_appBar.dart';
import 'package:stray_cat_home/pages/user_page/user.dart';
import 'package:stray_cat_home/widget/customAnimatedBottomBar.dart';
import 'package:stray_cat_home/util/theme.dart';

import 'pages/cat_map_page/CatHomeMap.dart';
import 'pages/cat_family_page/catInfo.dart';
import 'pages/community_page/community.dart';
class HomeIndexPage extends StatefulWidget {
  const HomeIndexPage({Key? key}) : super(key: key);

  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  int _currentIndex = 0;
  final _inactiveColor = Colors.black;
  Color backgroundColor =primary;
  List<String> titles = ['地图', '社区', '图鉴', '我的'];
  List<Widget> bodywidget = [
    const CatHomeMap(),
    const community(),
    const catInfo(),
    const userInfo(),
  ];
  List<Widget> AppBarWidget=[
    const CommunityAppBar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   brightness: Brightness.dark,
        //   automaticallyImplyLeading: false,
        //   title: Text(titles[_currentIndex],
        //     style: const TextStyle(
        //       color: Colors.black,
        //       fontSize: 28,
        //     ),
        //   ),
        // ),
        body: bodywidget[_currentIndex],
        bottomNavigationBar: _buildBottomBar());
  }
  Widget _buildBottomBar() {
    return  CustomAnimatedBottomBar(
      containerHeight: 56,
      backgroundColor: backgroundColor,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeInOut,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <MyBottomNavigationBarItem>[
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.home),
          title: Text(titles[0]),
          activeColor: const Color(0xfff4d144),
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.search),
          title: Text(titles[1]),
          activeColor: Colors.greenAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.apps),
          title: Text(
            titles[2],
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.video_camera_front),
          title: Text(titles[3]),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ], key: null,
    );
  }
}

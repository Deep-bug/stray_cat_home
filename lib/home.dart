import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/cat_family_page/controller/getCatFamilyListController.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: const EdgeInsets.only(left: 35, top: 42, right: 35),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/HomeIndexPage');
                    //  Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("导航栏"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_page');
                    //  Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("登录页"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/my');
                    //  Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("my"),
                ),
                ElevatedButton(
                  onPressed: () {
                    getCatFamilyList();
                    //  Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("获取猫咪列表"),
                )
              ],
            )
        )
    );
  }
}

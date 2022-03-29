import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stray_cat_home/pages/cat_family_page/catInfo.dart';
import 'package:stray_cat_home/pages/cat_map_page/CatHomeMap.dart';
import 'package:stray_cat_home/pages/community_page/community.dart';
import 'package:stray_cat_home/pages/home_page_v2/widget/home_tab_title.dart';
import 'package:stray_cat_home/pages/my_page/my_controller.dart';
import 'package:stray_cat_home/pages/my_page/my_page.dart';
import 'package:stray_cat_home/res/colors.dart';
import 'package:stray_cat_home/res/shadow_style.dart';
import 'package:stray_cat_home/res/strings.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);


  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  ///控制器
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance?.addObserver(this);

    ///监听TabBar切换事件
    tabController?.addListener(() {
      var index = tabController?.index;

      ///修复执行2次的BUG,增加条件
      if (tabController?.index == tabController?.animation?.value) {
        if (index == tabController!.length - 1) {
          Get.find<MyController>();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.color_F8F9FC,
      body: TabBarView(
        controller: tabController,
        children: const [CatHomeMap(), community(), catInfo(),MyPage()],
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: ShadowStyle.white12TopSpread4Blur10(radius: 0),
        child: TabBar(
          indicator: const BoxDecoration(),
          labelColor: ColorStyle.color_24CF5F,
          unselectedLabelColor: ColorStyle.color_B8C0D4,
          controller: tabController,
          tabs: [
            TabTitleIcon(
              title: StringStyles.homeComplex.tr,
              icon: Icons.send,
            ),
            TabTitleIcon(
              title: StringStyles.homeProject.tr,
              icon: Icons.account_balance_rounded,
            ),
            TabTitleIcon(
              title: StringStyles.catInfoPage,
              icon:  Icons.ac_unit,
            ),
            TabTitleIcon(
              title: StringStyles.homeMy.tr,
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}

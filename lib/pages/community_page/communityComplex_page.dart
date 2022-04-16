import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stray_cat_home/pages/community_page/sos_page/sos_page.dart';
import 'package:stray_cat_home/res/colors.dart';
import 'package:stray_cat_home/res/r.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/routers/routes.dart';

import 'adopt_page/adopt_page.dart';
import 'normal_page/community.dart';
import 'normal_page/normal_page.dart';

class CommunityComplexPage extends StatefulWidget {
  const CommunityComplexPage({Key? key}) : super(key: key);

  @override
  State<CommunityComplexPage> createState() => _CommunityComplexPageState();
}

class _CommunityComplexPageState extends State<CommunityComplexPage> with SingleTickerProviderStateMixin{
  TabController? tabController;

  @override
  void initState(){
    tabController=TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){ Get.toNamed(Routes.pushInfoPage);},
          icon:Icon(Icons.add),
          label: Text('发布动态'),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,

                    ///导航栏
                    child: TabBar(
                      isScrollable: true,
                      labelColor: ColorStyle.color_24CF5F,
                      unselectedLabelColor: ColorStyle.color_B8C0D4,
                      controller: tabController,
                      labelStyle: Styles.style_FE8C28_24_bold,
                      unselectedLabelStyle: Styles.style_FFAE2E_16,
                      tabs: [
                        Tab(
                          text: StringStyles.tabNormal.tr,
                        ),
                        Tab(
                          text: StringStyles.tabSos.tr,
                        ),
                        Tab(
                          text: StringStyles.tabAdopt.tr,
                        )
                      ],
                    ),
                  ),

                  ///间隔
                  const Expanded(child: SizedBox()),

                  // ///搜索框
                  // Ripple(
                  //     circular: 20,
                  //     onTap: () => Get.toNamed(Routes.searchPage),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(5),
                  //       child: SvgPicture.asset(
                  //         R.assetsImagesSearch,
                  //         color: Colors.black87,
                  //         width: 30,
                  //       ),
                  //     )),

                  Box.hBox20
                ],
              ),
              Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [community(), SosPage(), AdoptPage()],
                  )),
            ],
          ),
        )

    );
  }
}

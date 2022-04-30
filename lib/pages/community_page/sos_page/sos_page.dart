import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/base/get/get_save_state_view.dart';
import 'package:stray_cat_home/widget/cardWidget.dart';
import 'package:stray_cat_home/widget/pull_smart_refresher.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../community_controller.dart';

class SosPage extends GetSaveView<CommunityController> {
  const SosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 多少个card
    final int _itemCount = 10;
    // final CommunityItem Item;
    // 承载listView的滚动视图
    final ScrollController _scrollController = ScrollController();

    //手势检测器
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  // 同appBar的titleSpacing一致
                  horizontal: NavigationToolbar.kMiddleSpacing,
                  vertical: 5.0,
                ),
                // child: Stack(
                //   children: [
                //     ConstrainedBox(
                //       constraints: const BoxConstraints(
                //         maxHeight: 35,
                //       ),
                //       child: TextField(
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
                //           ///设置内容内边距
                //           contentPadding:
                //           const EdgeInsets.symmetric(vertical: 4.0),
                //           /// 前缀图标
                //           prefixIcon: const Icon(Icons.search),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ),
              Expanded(
                child:RefreshWidget<CommunityController>(
                  child: WaterfallFlow.builder(
                    // controller: _scrollController,
                    padding:
                    const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 30),
                    itemCount: controller.CommunityItemList.length,
                    gridDelegate:
                    SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                      // 主轴个数
                      crossAxisCount: 2,
                      /// 主轴间距
                      mainAxisSpacing: 5.0,
                      /// 纵轴间距
                      crossAxisSpacing: 5.0,
                      // 元素回收时候的回调
                      collectGarbage: (List<int> garbages) {},
                    ),
                    itemBuilder: (BuildContext bcontext, int index) {

                      // CardModel cm = CardModel();
                      return CardWidget(

                        ///封面图
                        image: FadeInImage.assetNetwork(
                          image: controller.CommunityItemList[index].cmuPids,
                          fit: BoxFit.cover,
                          placeholder: 'asserts/images/myhead.png' /* 占位图 */,
                        ),
                        ///用户头像
                        avatar: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            image: controller.CommunityItemList[index].avater,
                            width: 20,
                            fit: BoxFit.cover,
                            placeholder: 'asserts/images/3.0x/application_icon.png' /* 占位图 */,
                          ),
                        ),
                        ///描述
                        desc: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(controller.CommunityItemList[index].title),
                        ),
                        name: controller.CommunityItemList[index].nickname,
                        id: controller.CommunityItemList[index].id,
                      );
                    },
                  ),
                ),
              ),
              //  ),
            ],
          ),
        ),
      ),
    );
  }
}

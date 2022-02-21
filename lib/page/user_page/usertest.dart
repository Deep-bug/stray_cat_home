import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stray_cat_home/model/cardModel.dart';
import 'package:stray_cat_home/page/user_page/widget/AppBarTabsItem.dart';
import 'package:stray_cat_home/widget/cardWidget.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class usertest extends StatefulWidget {
  const usertest({Key? key}) : super(key: key);

  @override
  _usertestState createState() => _usertestState();
}

class _usertestState extends State<usertest> with TickerProviderStateMixin {
  late Widget _bgImage;
  int _currenTab = 0;
  late TabController _tabController;
  ScrollController _scrollController = ScrollController();

  //card
  int _itemCount = 10;
  //tab item
  Widget buildAppBarTabsItem(String text, int index) {
    return AppBarTabsItem(
      text: text,
      active: _currenTab == index,
      onTap: () {
        setState(() {
          _currenTab = index;
        });
        _tabController.animateTo(index);
      },
    );
  }

  //tab容器
  Widget buildAppBarTabs(List<String> _tabs) {
    int index = 0;
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _tabs.map((String name) {
          Widget _w = buildAppBarTabsItem(name, index);
          index++;
          return _w;
        }).toList());
  }

  @override
  void initState() {
    super.initState();
    //背景图片
    _bgImage = Image.network(
      'https://picsum.photos/${360}/${720}?random=1',
      fit: BoxFit.cover,
      width: double.infinity,
    );
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      var index = _tabController.index;
      var previewIndex = _tabController.previousIndex;
      print('index:$index, preview:$previewIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = ['笔记', '收藏', '赞过'];
    Size size = MediaQuery.of(context).size;
    SliverAppBar _sliverAppBar = SliverAppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        )
      ],
      pinned: true,
      expandedHeight: size.height / 2.7,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            _bgImage,
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ],
        ),
        title: SizedBox(
          height: size.height / 3.2,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              //头像
              ClipRRect(
                borderRadius: BorderRadius.circular(190),
                child: Image.asset(
                  'asserts/images/myhead.png',
                  width: 75.0,
                  height: 75.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Column(
                children: const [
                  Text('YEEVEN'),
                ],
              ))
            ],
          ),
        ),
      ),
    );
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: _sliverAppBar,
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.only(
              top: _sliverAppBar.toolbarHeight +
                  MediaQuery.of(context).padding.top),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8.0, top: 5.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //下方容器栏
                    buildAppBarTabs(_tabs),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _tabs.map((String name) {
                    return WaterfallFlow.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(
                          top: 5, left: 5, right: 5, bottom: 50),
                      itemCount: _itemCount,
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
                        CardModel cm = CardModel();
                        return CardWidget(
                          image: FadeInImage.assetNetwork(
                            image: cm.cardImg,
                            fit: BoxFit.cover,
                            placeholder: 'asserts/images/myhead.png' /* 占位图 */,
                          ),
                          avatar: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: FadeInImage.assetNetwork(
                              image: cm.cardAvatar,
                              width: 20,
                              fit: BoxFit.cover,
                              placeholder: 'asserts/images/myhead.png' /* 占位图 */,
                            ),
                          ),
                          desc: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10.0),
                            child: Text(cm.cardDesc),
                          ),
                          name: cm.cardName,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

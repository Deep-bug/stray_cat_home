import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/user_page/widget/AppBarTabsItem.dart';
import 'package:stray_cat_home/widget/cardModel.dart';
import 'package:stray_cat_home/widget/cardWidget.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class community extends StatefulWidget {
  const community({Key? key}) : super(key: key);

  @override
  _communityState createState() => _communityState();
}

class _communityState extends State<community> {
  // 默认选中的tab 0开始
  int _currentTab = 1;

  // 多少个card
  final int _itemCount = 10;

  // 用一个key来保存下拉刷新控件RefreshIndicator
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();
  // 承载listView的滚动视图
  final ScrollController _scrollController = ScrollController();
  // 数据源
  late List<String> _dataSource;
  // 当前加载的页数
  int _pageSize = 0;

  // 加载数据
  void _loadData(int index) {
    for (int i = 0; i < 15; i++) {
      _dataSource.add((i + 15 * index).toString());
    }
  }

  // 下拉刷新
  Future<void> _onRefresh() {
    return Future.delayed(const Duration(seconds: 2), () {
      print("正在刷新...");
      _pageSize = 0;
      _dataSource.clear();
      setState(() {
        _loadData(_pageSize);
      });
    });
  }

  // 加载更多
  Future<void> _loadMoreData() {
    return Future.delayed(const Duration(seconds: 1), () {
      print("正在加载更多...");

      setState(() {
        _pageSize++;
        _loadData(_pageSize);
      });
    });
  }

  // 刷新
  showRefreshLoading() {
    Future.delayed(const Duration(seconds: 0), () {
      _refreshKey.currentState?.show().then((e) {});
      return true;
    });
  }

  // @override
  // void initState() {
  //   print('home加载');
  //   /*  showRefreshLoading();
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       _loadMoreData();
  //     }
  //   }); */
  //   super.initState();
  // }

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
        buildAppBarTabsItem('日常', 0),
        buildAppBarTabsItem('求助', 1),
        buildAppBarTabsItem('领养', 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //手势检测器
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //remove bacIcon
          automaticallyImplyLeading: false,
          // 阴影
          elevation: 0,
          //backgroundColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          // title widget两边不留间隙
          // Defaults to [NavigationToolbar.kMiddleSpacing].
          // titleSpacing: 0.0,
          title: Container(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [

                buildAppBarTabs(),
              ],
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          // padding: EdgeInsets.symmetric(
          //   // 同appBar的titleSpacing一致
          //   horizontal: NavigationToolbar.kMiddleSpacing,
          // ),
          decoration: const BoxDecoration(

              ),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  // 同appBar的titleSpacing一致
                  horizontal: NavigationToolbar.kMiddleSpacing,
                  vertical: 5.0,
                ),
                child: Stack(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 35,
                      ),
                      child: TextField(
                        /// 设置字体
                        style: const TextStyle(),

                        /// 设置输入框样式
                        decoration: InputDecoration(
                          hintText: '请输入你想寻找的内容',
                          /// 边框
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide.none,
                          ),
                           fillColor: Colors.grey[200],
                          // 是否使用填充色
                          filled: false,
                          ///设置内容内边距
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 4.0),
                          /// 前缀图标
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  key: _refreshKey,
                  onRefresh: _onRefresh,
                  child: WaterfallFlow.builder(
                    controller: _scrollController,
                    padding:
                    const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 30),
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
                          borderRadius: BorderRadius.circular(10),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

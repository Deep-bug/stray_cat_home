import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stray_cat_home/base/get/base_no_page_controller.dart';
import 'package:stray_cat_home/res/r.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/widget/over_scroll_behavior.dart';

///不分页的过度策略
enum DetailRefreshState {
  ///加载中
  loading,

  ///加载成功
  success,

  ///加载失败
  failed,
}

class DetailRefreshWidget<Controller extends BaseNoPageController>
    extends StatefulWidget {
  DetailRefreshWidget({
    Key? key,
    this.onRefresh,
    required this.child,
  }) : super(key: key);
  final String? tag = null;

  ///获取BaseNoPageController子类对象
  Controller get getController => GetInstance().find<Controller>(tag: tag);

  ///刷新回掉
  VoidCallback? onRefresh;

  ///子类
  Widget child;

  @override
  State<StatefulWidget> createState() {
    return DetailRefreshWidgetState();
  }
}

class DetailRefreshWidgetState extends State<DetailRefreshWidget>
    with AutomaticKeepAliveClientMixin {
  RefreshController controller = RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
    debugPrint("加载刷新");
    widget.getController.initLoading(controller);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() => Visibility(
             visible: widget.getController.loadState.value == 1,
              // child: ScrollConfiguration(
              //     behavior: OverScrollBehavior(),
              //     child: SmartRefresher(
              //         controller: controller,
              //
              //         header: CustomHeader(
              //           builder: (BuildContext context, RefreshStatus? mode) {
              //             Widget header;
              //             if (mode == RefreshStatus.refreshing) {
              //               ///加载中
              //               header = Lottie.asset(R.assetsLottieRefreshHeader,
              //                   width: 100, animate: true);
              //             } else if (mode == RefreshStatus.failed) {
              //               header = Text(
              //                 StringStyles.refreshHeaderFailed.tr,
              //                 style: Styles.style_B8C0D4_14,
              //               );
              //             } else {
              //               ///加载成功
              //               header = Text(
              //                 StringStyles.refreshHeaderSuccess.tr,
              //                 style: Styles.style_B8C0D4_14,
              //               );
              //             }
              //             return SizedBox(
              //               height: 64,
              //               child: Center(child: header),
              //             );
              //           },
              //         ),
              //         footer: CustomFooter(
              //           builder: (BuildContext context, LoadStatus? mode) {
              //             Widget footer;
              //             if (mode == LoadStatus.idle) {
              //               ///下拉提示
              //               footer = const Text("pull up load");
              //             } else if (mode == LoadStatus.loading) {
              //               ///加载中
              //               footer = Lottie.asset(R.assetsLottieRefreshFooter,
              //                   width: 200, animate: true);
              //             } else if (mode == LoadStatus.failed) {
              //               ///加载失败
              //               footer = Text(
              //                 StringStyles.refreshError.tr,
              //                 style: Styles.style_B8C0D4_14,
              //               );
              //             } else {
              //               ///无更多数据
              //               footer = Text(
              //                 StringStyles.refreshNoData.tr,
              //                 style: Styles.style_B8C0D4_14,
              //               );
              //             }
              //             return SizedBox(
              //               height: 60,
              //               child: Center(child: footer),
              //             );
              //           },
              //         ),
                     child: widget.child)
    // )
    // )
    ),

          ///未加载前显示的动画，加载之后需要隐藏
          Obx(
            () => Visibility(
                visible: widget.getController.loadState.value == 0,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Lottie.asset(R.assetsLottiePageLoading,
                      width: 200, height: 200, animate: true),
                )),
          ),
          //
          Obx(
            () => Visibility(
                visible: widget.getController.loadState.value == 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(R.assetsLottieRefreshEmpty,
                        width: 200, animate: true, repeat: false),
                    Text(
                      StringStyles.refreshEmpty.tr,
                      style: Styles.style_B8C0D4_13,
                    )
                  ],
                )),
          ),

          ///加载出错的页面
          Obx(() => Visibility(
                visible: widget.getController.loadState.value == 3,
                child: Lottie.asset(
                  R.assetsLottieRefreshError,
                  width: 200,
                  animate: true,
                ),
              )),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

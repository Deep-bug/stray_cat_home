import 'dart:math';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:stray_cat_home/pages/community_page/widget/favorite_button.dart';
import 'package:stray_cat_home/routers/routes.dart';

import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final Widget image;
  final Widget avatar;
  final String id;
  final Widget desc;
  final String name;
  const CardWidget({
    Key? key,
    required this.image,
    required this.avatar,
    required this.desc,
    required this.name,
    required this.id,
  }) : super(key: key);
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // var lastTapDown = 0;
  // @override
  // void initState() {
  //   // 滚动出视野组件被销毁了
  //   print("card 加载");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {

    ThemeData _theme = Theme.of(context);
    Color _disabledColor = _theme.disabledColor;
    TextStyle textStyle = TextStyle(
      decoration: TextDecoration.none,
      color: _disabledColor,
      fontSize: _theme.textTheme.bodyText1!.fontSize! - 2,
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: ()=>Get.toNamed(Routes.getCommunityCardDetail,arguments: widget.id),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0)),
              // 在线获取图片
              child: widget
                  .image, /*  FadeInImage.assetNetwork(
                image:
                    "https://picsum.photos/360/${randomHeight(minUnit: 3, maxUnit: 4)}?random=${widget.key}",
                fit: BoxFit.cover,
                placeholder: 'assets/images/my_head.jpg' /* 占位图 */,
              ), */
              // 测试容器用的widget
              /* child: Container(
                width: 360.0,
                height: randomHeight(minUnit: 3, maxUnit: 6) * .5,
                color: Colors.green,
                child: Center(
                  child: Text(
                    '${widget.key}',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ), */
            ),
            // 描述文字
            widget.desc,
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.pink,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 用户头像
                          widget.avatar,
                          const SizedBox(
                            width: 5,
                          ),
                          // 用户名
                          Expanded(
                            child: Text(
                              widget.name,
                              style: textStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 收藏按钮
                  FavoriteBtn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


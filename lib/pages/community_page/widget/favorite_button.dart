// 把按钮组件拿出来,不然每次点击收藏更新widget的时候会把card widget也一起刷新了
// 这样会造成不必要的多次渲染和请求
// 只需要重新渲染当前的按钮widget就够了
import 'dart:math';

import 'package:flutter/material.dart';

class FavoriteBtn extends StatefulWidget {
  @override
  _FavoriteBtnState createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn>
    with AutomaticKeepAliveClientMixin {
  //不会被销毁,占内存中
  bool get wantKeepAlive => true;
  bool liked = false;
  int howLiked = Random().nextInt(5000);
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ThemeData _theme = Theme.of(context);

    Color _disabledColor = _theme.disabledColor;
    TextStyle textStyle = TextStyle(
      decoration: TextDecoration.none,
      color: _disabledColor,
      fontSize :_theme.textTheme.bodyText1!.fontSize!-2,
    );
    return GestureDetector(
      onTap: () {
        setState(() {
          this.liked = !this.liked;
          if (this.liked) {
            this.howLiked++;
          } else {
            --this.howLiked;
          }
        });
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              color: liked ? _theme.primaryColor : _disabledColor,
              size: IconTheme.of(context).size !- 6,
            ),
            const SizedBox(
              width: 3,
            ),
            Text("${howLiked}", style: textStyle)
          ],
        ),
      ),
    );
  }
}
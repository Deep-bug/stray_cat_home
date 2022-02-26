import 'package:flutter/material.dart';

class PageTitleName extends StatelessWidget {
  const PageTitleName({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '猛兽图鉴',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      //搜索按钮
    );
  }
}

import 'package:flutter/material.dart';
class AppBarTabsItem extends StatelessWidget {
  const AppBarTabsItem({ Key? key,required this.text,required this.onTap,required this.active})
      : super(key: key);
  final String text;
  //签名？
  final GestureTapCallback onTap;
  final bool active;
  @override
  Widget build(BuildContext context) {
    ThemeData _theme=Theme.of(context);
    return GestureDetector(
      //
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top:5,bottom:5),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border(
                    bottom: BorderSide(
                      width: 2.0,
                      color: active ? _theme.primaryColor : Colors.transparent,
                    ),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    //使用风格不一致问题
                    decoration: TextDecoration.none,
                    color: active ? Colors.black : _theme.disabledColor,
                    fontSize:_theme.textTheme.bodyText1!.fontSize! + 3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

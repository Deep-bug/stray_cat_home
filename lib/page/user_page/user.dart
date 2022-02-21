import 'package:flutter/material.dart';
import 'package:stray_cat_home/util/theme.dart';

class userInfo extends StatefulWidget {
  const userInfo({Key? key}) : super(key: key);

  @override
  _userInfoState createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primary,
        padding: const EdgeInsets.only(top: 240),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(

              )
          ),
          child: Column(
            children: const <Widget>[
            
            ],
          )
        ),
      ),
    );
  }
}

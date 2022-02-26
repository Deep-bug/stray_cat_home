import 'package:flutter/material.dart';
import 'package:stray_cat_home/util/theme.dart';

import 'widget/login_form.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primary,
        padding: const EdgeInsets.only(top: 126),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)
              )
          ),
          child: Column(
            children: <Widget>[
              TabBar(
                  labelColor: primary,
                  controller: _tabController,
                  tabs: const <Widget>[Tab(text: "登录"), Tab(text: "注册")]),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    Center(
                      child: loginForm(),
                    ),
                    Center(
                      child: Text("注册"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

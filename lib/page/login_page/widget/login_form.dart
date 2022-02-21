import 'package:flutter/material.dart';
import 'package:stray_cat_home/util/theme.dart';

import '../contraller.dart';

class loginForm extends StatefulWidget {
  const loginForm({Key? key}) : super(key: key);
  @override
  _loginFormState createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _uNameController = new TextEditingController();
    TextEditingController _pwdController = new TextEditingController();

       //TextEditingController usernameController = TextEditingController(text: "username");
    return Container(
      padding: const EdgeInsets.only(left: 35, top: 42, right: 35),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.start,
        children:  <Widget>[
          const Text(
            "用户登录",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text("欢迎关注校园流浪猫平台",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              letterSpacing: 0,
              fontWeight: FontWeight.w400,
            ),
          ),
         const SizedBox(
           width: 35,
           height: 35,
         ),
             TextFormField(
               controller: _uNameController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '用户名/手机号',
              ),
            ),
          const SizedBox(
            width: 35,
            height: 35,
          ),
          TextFormField(
           // controller:{TextEditingController _userName = TextEditingController(),
            controller: _pwdController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '密码',
            ),
          ),
          const SizedBox(
            width: 35,
            height: 35,
          ),
          const Text(
            "忘记密码",
            style: TextStyle(
              fontSize: 12,
              color: primary,
              letterSpacing: 0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
                onPressed: () {login(_pwdController.text,_uNameController.text);},
                child: const Text("登录"),
            ),
          ),
          const SizedBox(

            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("没有账号？"),
              Text("立即注册")
            ],
          )
        ],
      ),
    );
  }
}

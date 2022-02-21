import 'package:flutter/material.dart';
import 'package:stray_cat_home/network/new_api/apis.dart';
import 'package:stray_cat_home/network/new_api/request.dart';
import 'package:stray_cat_home/network/new_api/request_client.dart';
import 'models/access_token_entity.dart';
import 'models/login_get_token_entity.dart';

void login(String password, String username) => request(() async {
      LoginGetTokenEntity params = LoginGetTokenEntity();
      params.username = username;
      params.password = password;
      AccessTokenEntity? accessTokenEntity =
          await requestClient.post<AccessTokenEntity>(APIS.login, data: params);
      print("-----------二次拍平----------------");
      String? token = accessTokenEntity?.token.toString();
      print(token);

      // /// 获取共享
      // //final Authorization = await SharedPreferences.getInstance();
      // ///将整数值保存到"token"键
      // //await Authorization.setString('AuthorizationToken', token!);
      // SharedPreferencesUtil.saveData<String>("AuthorizationToken", token!);
      // print("-----------保存完毕----------------");
      // SharedPreferencesUtil.getData<String>("myData").then((value) {
      //   String? token = value;
      // });
      // print(token);
      //print(SharedPreferencesUtil.getData("AuthorizationToken").then((value) => ));
    });

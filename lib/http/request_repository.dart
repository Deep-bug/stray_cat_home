import 'package:flutter/cupertino.dart';
import 'package:stray_cat_home/http/request_api.dart';
import 'package:stray_cat_home/model/project_model.dart';
import 'package:stray_cat_home/model/request_register.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_detail.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_list_model.dart';
import 'package:stray_cat_home/pages/community_page/models/communityItem.dart';
import 'package:stray_cat_home/util/sp_util.dart';
import 'package:stray_cat_home/http/request.dart';



import 'http_request.dart';

typedef SuccessOver<T> = Function(T data, bool over);

/// @class : RequestRepository
/// @date : 2021/08/25
/// @description : 请求仓库
class RequestRepository {
  ///登录请求
  /// [account]账号
  /// [password]密码
  /// [password]重复密码
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  register(
    String account,
    String password,
    String rePassword, {
    Success<UserEntity>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(
      RequestApi.apiRegister, {
      "username": account,
      "password": password,
      "rePassword": rePassword
    }, success: (data) {
      var registerInfo = UserEntity.fromJson(data);
      registerInfo.password = password;
      SpUtil.putUserInfo(registerInfo);
      if (success != null) {
        success(registerInfo);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  ///登录请求
  /// [account]账号
  /// [password]密码
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  login(
    String username,
    String password, {
    Success<UserEntity>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(
        RequestApi.apiLogin, {
          "username": username,
      "password": password},
        success: (data) {
      var loginInfo = UserEntity.fromJson(data);
      loginInfo.password = password;
      SpUtil.putUserInfo(loginInfo);
      if (success != null) {
        success(loginInfo);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }

  ///退出登录
  exitLogin({
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.apiLogout, {}, dialog: false,
        success: (data) {
          if (success != null) {
            success(true);
          }
        }, fail: (code, msg) {
          if (fail != null) {
            fail(code, msg);
          }
        });
  }

  ///获取用户信息
  getUserInfo(
    String username,{
    Success<UserEntity>? success,
    Fail? fail
  }) {
    Request.post<dynamic>(
        RequestApi.apiUserInfo, {
          "username": username
         },dialog: false, success: (data) {
      debugPrint("返回用户信息为=>$data");
      var userInfo = data["userInfo"];
      debugPrint("返回用户信息解析后为=>$userInfo");
      userInfo = UserEntity.fromJson(userInfo);
          if (success != null) {
            success(userInfo);
          }
        }, fail: (code, msg) {
          if (fail != null) {
            fail(code, msg);
          }
        });
  }

  ///条件筛选猫咪列表
  /// [catname]猫咪名字
  /// 【catstate】猫咪状态
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  collectCatList(
    String catname,
    String catstate,{
    Success<List<CatListModel>>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(RequestApi.apiSelectCatInfo,{
      "catname":catname,
      "catstate":catstate
    },success:(data) {
      CatListPage catListPage = CatListPage.fromJson(data);
      var list = catListPage.catBasicList.map((value) {
        return CatListModel.fromJson(value);
      }).toList();
      if (success != null) {
        success(list);
      }
     } ,fail: (code,msg){
      if(fail!=null){
        fail(code,msg);
      }
    });
  }

  ///无条件筛选猫咪列表
  /// [catname]猫咪名字
  /// 【catstate】猫咪状态
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  AllCatList(
      {
        Success<List<CatListModel>>? success,
        Fail? fail,
      }) {
    Request.get<dynamic>(RequestApi.apiAllCatInfo,{},dialog: false,success:(data) {
      CatListPage catListPage = CatListPage.fromJson(data);
      var list = catListPage.catBasicList.map((value) {
        return CatListModel.fromJson(value);
      }).toList();
      if (success != null) {
        success(list);
      }
    } ,fail: (code,msg){
      if(fail!=null){
        fail(code,msg);
      }
    });
  }

  ///请求猫咪详细信息
  /// [catnumber]账号
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  getCatDetailInfo(
      String catnumber,{
        Success<CatInfoDetailModel>? success,
        Fail? fail,
       }) {
    Request.post<dynamic>(
        RequestApi.apiGetCatDetailInfo, {
      "id": catnumber
    },dialog: false, success: (data) {
      debugPrint("返回猫咪详细信息=>$data");
      CatInfoDetailModel catInfoDetailModel = CatInfoDetailModel.fromJson(data);
      if (success != null) {
        success(catInfoDetailModel);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }


  ///请求社区分页动态
  ///[page]
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
   RequestCommunityItem(
       int page,{
         SuccessOver<List<CommunityItem>>? success,
         Fail? fail,
        }){
    Request.post<dynamic>(
        RequestApi.apiGetPageCommunityMessage, {'page':page},dialog: false,success:(data){
          ProjectPage pageData=ProjectPage.fromJson(data);
          var list=pageData.datas.map((value) {
            return CommunityItem.fromJson(value);
          }).toList();
          if(success!=null){
            success(list,pageData.over);
          }
    },fail: (code,msg){
          if(fail!=null){
            fail(code,msg);
          }
    });
   }

   ///
}

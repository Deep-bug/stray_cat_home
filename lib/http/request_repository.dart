import 'package:flutter/cupertino.dart';
import 'package:stray_cat_home/http/request_api.dart';
import 'package:stray_cat_home/model/request_register.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_list_model.dart';
import 'package:stray_cat_home/util/sp_util.dart';
import 'package:stray_cat_home/http/request.dart';



import 'http_request.dart';

typedef SuccessOver<T> = Function(T data, bool over);

/// @class : RequestRepository
/// @date : 2021/08/25
/// @name : jhf
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
  //
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
  //
  //  ///请求项目列表接口
  // ///[id]文章ID
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // requestTabModule(
  //   int page, {
  //   SuccessOver<List<ProjectDetail>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<dynamic>(
  //       RequestApi.apiProject.replaceFirst(RegExp('page'), '$page'), {},
  //       dialog: false, success: (data) {
  //     ProjectPage pageData = ProjectPage.fromJson(data);
  //     var list = pageData.datas.map((value) {
  //       return ProjectDetail.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///请求积分排行榜接口
  // ///[id]文章ID
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // rankingPoints(
  //   int page, {
  //   SuccessOver<List<Ranking>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<dynamic>(
  //       RequestApi.apiRanking.replaceFirst(RegExp('page'), '$page'), {},
  //       dialog: false, success: (data) {
  //     ///先解析外层分页
  //     ProjectPage pageData = ProjectPage.fromJson(data);
  //
  //     ///数组解析
  //     var list = pageData.datas.map((value) {
  //       return Ranking.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///请求积分排行榜接口
  // ///[id]文章ID
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // pointsDetail(
  //   int page, {
  //   SuccessOver<List<Points>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<dynamic>(
  //       RequestApi.apiPoints.replaceFirst(RegExp('page'), '$page'), {},
  //       dialog: false, success: (data) {
  //     ///先解析外层分页
  //     ProjectPage pageData = ProjectPage.fromJson(data);
  //
  //     ///数组解析
  //     var list = pageData.datas.map((value) {
  //       return Points.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///我收藏的文章列表
  // ///此处page 必须减去1，此处从0开始
  // ///[id]文章ID
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // collectDetail(
  //   int page, {
  //   SuccessOver<List<CollectDetail>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<dynamic>(
  //       RequestApi.apiCollectDetail.replaceFirst(RegExp('page'), '${page - 1}'),
  //       {},
  //       dialog: false, success: (data) {
  //     ProjectPage pageData = ProjectPage.fromJson(data);
  //     var list = pageData.datas.map((value) {
  //       return CollectDetail.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///退出登录
  // exitLogin({
  //   Success<bool>? success,
  //   Fail? fail,
  // }) {
  //   Request.post<dynamic>(RequestApi.apiLogout, {}, dialog: false,
  //       success: (data) {
  //     if (success != null) {
  //       success(true);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///请求问答接口
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // requestAskModule(
  //   int page, {
  //   SuccessOver<List<ProjectDetail>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<dynamic>(
  //       RequestApi.apiAsk.replaceFirst(RegExp('page'), '$page'), {},
  //       dialog: false, success: (data) {
  //     ProjectPage pageData = ProjectPage.fromJson(data);
  //     var list = pageData.datas.map((value) {
  //       return ProjectDetail.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///请求广场列表接口
  // /// [page] 当前页面
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // requestSquareModule(
  //   int page, {
  //   SuccessOver<List<ProjectDetail>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<dynamic>(
  //       RequestApi.apiSquare.replaceFirst(RegExp('page'), '${page - 1}'), {},
  //       dialog: false, success: (data) {
  //     ProjectPage pageData = ProjectPage.fromJson(data);
  //     var list = pageData.datas.map((value) {
  //       return ProjectDetail.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///获取首页的Banner图片
  // getBanner({
  //   Success<List<Banners>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<List<dynamic>>(RequestApi.apiBanner, {}, dialog: false,
  //       success: (data) {
  //     if (success != null) {
  //       var list = data.map((value) {
  //         return Banners.fromJson(value);
  //       }).toList();
  //       success(list);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///获取搜索热词
  // getSearchHotWord({
  //   Success<List<HotWord>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<List<dynamic>>(RequestApi.apiHotWord, {}, dialog: false,
  //       success: (data) {
  //     if (success != null) {
  //       var list = data.map((value) {
  //         return HotWord.fromJson(value);
  //       }).toList();
  //       success(list);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///根据关键词搜索文章
  // /// [page]当前页码
  // /// [hotWord] 当前热词
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // searchKeyWord(
  //   int page,
  //   String hotWord, {
  //   SuccessOver<List<ProjectDetail>>? success,
  //   Fail? fail,
  // }) {
  //   Request.post<Map<String, dynamic>>(
  //       RequestApi.apiSearchWord.replaceFirst(RegExp('page'), '$page'),
  //       {
  //         "k": hotWord,
  //       },
  //       dialog: false, success: (data) {
  //     ProjectPage pageData = ProjectPage.fromJson(data);
  //     var list = pageData.datas.map((value) {
  //       return ProjectDetail.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///请求首页文章列表接口
  // ///[id]文章ID
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // requestHomeArticle(
  //   int page, {
  //   SuccessOver<List<ProjectDetail>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<dynamic>(
  //       RequestApi.apiHome.replaceFirst(RegExp('page'), '${page - 1}'), {},
  //       dialog: false, success: (data) {
  //     ProjectPage pageData = ProjectPage.fromJson(data);
  //     var list = pageData.datas.map((value) {
  //       return ProjectDetail.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///获取微信公众号列表
  // getWechatPublic({
  //   Success<List<WechatPublic>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<List<dynamic>>(RequestApi.apiWechatPublic, {}, dialog: false,
  //       success: (data) {
  //     if (success != null) {
  //       var list = data.map((value) {
  //         return WechatPublic.fromJson(value);
  //       }).toList();
  //       success(list);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // /// 分享文章到站点
  // /// [title] 文章标题
  // /// [link] 文章链接
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // shareArticle(
  //   String title,
  //   String link, {
  //   Success<String>? success,
  //   Fail? fail,
  // }) {
  //   Request.post(RequestApi.apiAddArticle, {'title': title, 'link': link},
  //       dialog: false, success: (data) {
  //     if (success != null) {
  //       success("success");
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  // }
  //
  // ///请求首页文章列表接口
  // ///[id]文章ID
  // /// [success] 请求成功回调
  // /// [fail] 请求失败回调
  // requestShareArticleList(
  //   int page, {
  //   ParamSingleCallback<int>? length,
  //   SuccessOver<List<ProjectDetail>>? success,
  //   Fail? fail,
  // }) {
  //   Request.get<dynamic>(
  //       RequestApi.apiShareArticleList.replaceFirst(RegExp('page'), '$page'),
  //       {},
  //       dialog: false, success: (data) {
  //     ProjectPage pageData = ProjectPage.fromJson(data['shareArticles']);
  //     var list = pageData.datas.map((value) {
  //       return ProjectDetail.fromJson(value);
  //     }).toList();
  //     if (success != null) {
  //       success(list, pageData.over);
  //     }
  //     if(length != null){
  //       length(pageData.total);
  //     }
  //   }, fail: (code, msg) {
  //     if (fail != null) {
  //       fail(code, msg);
  //     }
  //   });
  //}
}

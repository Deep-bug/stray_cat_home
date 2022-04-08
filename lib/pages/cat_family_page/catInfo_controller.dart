
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stray_cat_home/base/get/controller/base_page_controller.dart';
import 'package:stray_cat_home/base/get/controller/base_page_test_controller.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_list_model.dart';
import 'package:stray_cat_home/util/refresher_extension.dart';
import 'package:stray_cat_home/widget/pull_smart_refresher.dart';

///猫咪图鉴控制器
class CatInfoController extends BaseGetPageController{
  List<CatListModel> catInfoList = [];

  @override
  void requestData(RefreshController controller,
      {Refresh refresh=Refresh.first}){
      request.AllCatList(success:(data){
      RefreshExtension.onSuccess(controller, refresh, true);
      debugPrint("获取猫咪信息>>>$data");
      if(refresh !=Refresh.first ){
        catInfoList.clear();
      }
      catInfoList.addAll(data);
      showSuccess(catInfoList);
      update();
      },fail: (code,msg){
        showError();
        RefreshExtension.onError(controller, refresh);
    });
  }



}

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stray_cat_home/widget/pull_smart_refresher.dart';

import '../getx_controller_inject.dart';

///猫咪信息
class BaseGetCatInfoController extends BaseGetController{

  var loadState=0.obs;

  ///是否初次加载
  var isInit=true;

  var controller;

  ///加载成功显示空页面
  showSuccess(List suc){
    loadState.value=suc.isNotEmpty? 1 : 2;
  }

  ///加载失败显示失败页面
  showError(){
    loadState.value=0;
  }

  ///预留初次加载
  initPullLoading(RefreshController controller){
    if(isInit){
      this.controller=controller;
      requestData(controller);
    }
  }

  ///网络请求在此处进行，不用在重复进行上拉下拉的处理
  void requestData(RefreshController controller , {Refresh refresh = Refresh.first}) {}



}

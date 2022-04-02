import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stray_cat_home/base/get/getx_controller_inject.dart';
import 'package:stray_cat_home/widget/detail_refresh_widget.dart';

///不分页状态加载控制器
class BaseNoPageController extends BaseGetController{
  ///加载状态 0加载中 1加载成功 2加载失败
  var loadState=0.obs;

  var controller;

  var isInit=true;

  showSuccess(){
    loadState.value=1;
  }
  showError(){
    loadState.value=3;
  }
  showLoading(){
    loadState.value=0;
  }
  initLoading(RefreshController controller){
    if(isInit){
      this.controller=controller;
      requestData(controller);
    }

  }

  ///加载请求
  void requestData(RefreshController controller,{DetailRefreshState detailRefreshState=DetailRefreshState.loading}){}

}
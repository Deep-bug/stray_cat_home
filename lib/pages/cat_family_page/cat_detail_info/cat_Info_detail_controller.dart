
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stray_cat_home/base/get/base_no_page_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_detail.dart';
import 'package:stray_cat_home/util/refresher_extension.dart';
import 'package:stray_cat_home/widget/detail_refresh_widget.dart';

class CatInfoDetailController extends BaseNoPageController{
   CatInfoDetailModel catInfoDetailModel= CatInfoDetailModel(catcharacter: "sssss", catdesc: "asdasda", catgender: "女", catname: "我的", catweight: 38, id: "2222",catpids: ["http://101.132.45.190:9000/starycathome/a6db5b0a72d84a4bb9ffa6220ecc6358.png", "http://101.132.45.190:9000/starycathome/c1828567775f4eb4b93621cd41b7f70b.png"],statelist: "状态加载中",);

  var catnumber=Get.arguments;

  @override
  void requestData(RefreshController controller,{DetailRefreshState detailRefreshState=DetailRefreshState.loading}){
   debugPrint("加载中");
    request.getCatDetailInfo(catnumber,success: (data){
      RefreshExtension.NoPageSuccess(controller, detailRefreshState);
      catInfoDetailModel=data;
      if(catInfoDetailModel.catname.isNotEmpty){
        loadState.value=1;
      }else{
        loadState.value=2;
      }
      update();
    },fail: (code,msg){
      loadState.value=3;
      // RefreshExtension.onError(controller,detailRefreshState );
    });


  }
  // @override
  // void onReady(){
  //   debugPrint("开始请求");
  //   request.getCatDetailInfo(catnumber,success: (data){
  //     debugPrint("进入详情页面");
  //     catInfoDetailModel=data;
  //     // showSuccess(catInfoDetailModel);
  //     update();
  //   },fail: (code,msg){
  //   });
  //   super.onReady();
  // }
  // @override
  // void onInit(){
  //   super.onInit();
  //
  //
  // }
  // showSuccess(CatInfoDetailModel suc){
  //   loadState.value=suc.toString().isEmpty? 1:2;
  // }
  // showError(){
  //   loadState.value=3;
  // }
  // showLoading(){
  //   loadState.value=0;
  //
  // }
  // ///
  // initPullLoading(RefreshController controller){
  //
  //   if(isInit){
  //     this.controller=controller;
  //     request.getCatDetailInfo(catnumber,success: (data){
  //       catInfoDetailModel=data;
  //       showSuccess(catInfoDetailModel);
  //       update();
  //     },fail: (code,msg){
  //     });
  //   }
  // }




}

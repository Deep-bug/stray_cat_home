
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:stray_cat_home/base/get/base_no_page_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_detail.dart';
import 'package:stray_cat_home/pages/community_page/models/CmuDetail.dart';
import 'package:stray_cat_home/util/refresher_extension.dart';
import 'package:stray_cat_home/widget/detail_refresh_widget.dart';

class CommunityCardController extends BaseNoPageController{
CmuDetail cmuDetail=CmuDetail(avater: "avater", cmuClassify: 1, cmuPids: ["cmuPids"], content: "content", id: "id", nickname: "nickname", title: "title", uid: "uid");
  var id=Get.arguments;

  @override
  void requestData(RefreshController controller,{DetailRefreshState detailRefreshState=DetailRefreshState.loading}){
    debugPrint("加载中");
    request.getCommunityDetailInfo(id,success: (data){
      RefreshExtension.NoPageSuccess(controller, detailRefreshState);
      cmuDetail=data;
      if(cmuDetail.id.isNotEmpty){
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


}

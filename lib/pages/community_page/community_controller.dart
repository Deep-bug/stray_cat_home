import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stray_cat_home/base/get/controller/base_page_controller.dart';
import 'package:stray_cat_home/pages/community_page/models/communityItem.dart';
import 'package:stray_cat_home/util/refresher_extension.dart';
import 'package:stray_cat_home/widget/pull_smart_refresher.dart';
///社区分页页面控制器
class CommunityController extends BaseGetPageController{
    List<CommunityItem> CommunityItemList=[];

    @override
    void requestData(RefreshController controller,
    {Refresh refresh=Refresh.first}){
        request.RequestCommunityItem(page,success:(data,over){
            RefreshExtension.onSuccess(controller, refresh, over);
            if(refresh!=Refresh.down){
                CommunityItemList.clear();
            }
            CommunityItemList.addAll(data);
            showSuccess(CommunityItemList);
            update();
        },fail: (code,msg){
            showError();
            RefreshExtension.onError(controller, refresh);
        }
        );
    }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/network/new_api/apis.dart';
import 'package:stray_cat_home/network/new_api/request_client.dart';
import 'package:stray_cat_home/pages/cat_family_page/controller/c_list_entity.dart';
import 'package:stray_cat_home/pages/cat_family_page/controller/getCatFamilyListController.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_entity.dart';
import 'cat_item.dart';
class CatGridView extends StatefulWidget {
  const CatGridView({
       Key? key,
       required this.size
      }) : super(key: key);
  final Size size;
  @override
  State<CatGridView> createState() => _CatGridViewState();
}

class _CatGridViewState extends State<CatGridView> {

  //定义全局卡片数
  int? cardCount=0;
  List<CListCatBasic>? catList=[
  //   Cat('11111','http://101.132.45.190:9000/cathomeapp/36226cba05b5427abdfbb04d0abd6bbe.jpg','demo','健康',Colors.white),
  //   Cat('111111','asserts/images/loadingPicture.jpeg','demo2','健康',Colors.white),
  //   Cat('111111','asserts/images/loadingPicture.jpeg','demo3','健康',Colors.white),
  //   Cat('111111','asserts/images/loadingPicture.jpeg','demo4','健康',Colors.white),
  //   Cat('111111','asserts/images/loadingPicture.jpeg','demo5','健康',Colors.white),
  //   Cat('111111','asserts/images/loadingPicture.jpeg','demo6','健康',Colors.white),
   ];
  @override
  void initState(){
    _getCatInfoList();

    // print(catList);
    ///将返回的map对象转为list
    //   CatBasicListEntity? catBasciInfoList = await requestClient.get(APIS.getCatBasicList) ;
    //   List<CatBasicListCatBasicList>? catList=catBasciInfoList?.catBasicList;
    }

  void _getCatInfoList( ) async {
    CListEntity? catBasicInfoList=await requestClient.get<CListEntity>(APIS.getCatBasicList);
    print("返回原始报文："+catBasicInfoList.toString());
    catList=catBasicInfoList?.catBasicList;
    //catList= getCatFamilyList();
    print("-------返回---------");
    print(catList.toString());
    cardCount=catList?.length;
    print(catList?.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          // itemCount: catList?.length,
          itemCount:cardCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return CatItem(
              size: size,
              catBasic: catList![index],
            );
         },
        ),
      ),
    );
  }
}

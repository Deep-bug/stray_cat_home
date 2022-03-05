
import 'package:stray_cat_home/network/new_api/apis.dart';
import 'package:stray_cat_home/network/new_api/request.dart';
import 'package:stray_cat_home/network/new_api/request_client.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_farmily_list_entity.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_entity.dart';

Future getCatFamilyList() => request(() async {
  CatFarmilyListEntity params=CatFarmilyListEntity();
  CatFarmilyListEntity? CatFarmilyList=  await requestClient.get<CatFarmilyListEntity>(APIS.getCatBasicList);
  print("----------获取校园猫咪列表------");
  List<Cat>? catList=CatFarmilyList?.result;
  print(catList);
});
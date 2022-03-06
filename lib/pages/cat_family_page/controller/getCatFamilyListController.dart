
import 'dart:convert';

import 'package:stray_cat_home/generated/json/base/json_convert_content.dart';
import 'package:stray_cat_home/network/new_api/apis.dart';
import 'package:stray_cat_home/network/new_api/request.dart';
import 'package:stray_cat_home/network/new_api/request_client.dart';
import 'package:stray_cat_home/pages/cat_family_page/catInfo.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_entity.dart';

import 'c_list_entity.dart';

 Future getCatFamilyList() => request(() async {
//   print("----------获取校园猫咪列表------");
//   CListEntity? catBasciInfoList = await requestClient.get(APIS.getCatBasicList) ;
//   List<CListCatBasic>? catList=catBasciInfoList?.catBasicList;
//   String RawData=catList.toString();
//   print("输出raw"+RawData);
//   // List<Cat> resultList=[];
//   // int? clength=catList?.length;
//   // print("--------开始输出--------");
//   // print(catList);
//   // print("------------开始转换---------------");
//   // List<Cat>? cats = jsonConvert.convert<List<Cat>>(jsonDecode(RawData));
//   // print("输出"+cats.toString());
//
//   return catList;
 });
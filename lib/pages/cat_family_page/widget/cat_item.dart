import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:stray_cat_home/pages/cat_family_page/cat_detail_info/cat_detail_page.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_entity.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_list_model.dart';
import 'package:stray_cat_home/routers/routes.dart';

class CatItem extends StatelessWidget {
  int index=0;
  //final Cat cat;

   CatItem(
      {
        Key? key,
        required this.size,
        required this.catModel,
       // required this.catBasic
     }
  ) : super(key: key);
  final Size size;
  final CatListModel  catModel;
  @override
  Widget build(BuildContext context) {
    //InWell有一段交互动画
    return InkWell(
      onTap: () => Get.toNamed(Routes.getCatInfoDetail,arguments: catModel.catnumber),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: (size.width - 45) / 2,
            height: (size.width - 45) / 2,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(16),
            ),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:FadeInImage.assetNetwork(
              image:catModel.imageurl,
              placeholder: 'asserts/images/loadingPicture.jpeg',
              fit: BoxFit.cover,
             ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            catModel.name,
            style: const TextStyle(
              fontSize: 14,
             // color: mScroudTextColor,
            ),
          ),
          Text(
            catModel.state,
            style: const TextStyle(
             // color: mPrimaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

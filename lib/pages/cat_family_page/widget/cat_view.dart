import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/base/get/get_save_state_view.dart';
import 'package:stray_cat_home/pages/cat_family_page/catInfo_controller.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_list_model.dart';
import 'package:stray_cat_home/widget/pull_smart_refresher.dart';

import 'cat_item.dart';

class CatGridView extends GetSaveView<CatInfoController> {
    CatGridView(
    {Key? key,
    required this.size,
    }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:RefreshWidget<CatInfoController>(
          child: GridView.builder(
          // itemCount: catList?.length,
          itemCount: controller.catInfoList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return CatItem(
              size: size,
              catModel: controller.catInfoList[index],
            );
          },
        ),),
      )
    );
  }
}


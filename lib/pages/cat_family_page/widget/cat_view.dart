import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_entity.dart';
import 'cat_item.dart';

class CattGridView extends StatelessWidget {
   CattGridView({Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  //通过接口获得list
  final List<Cat> catItemList=[
    Cat('11111','asserts/images/loadingPicture.jpeg','demo','健康',Colors.white),
    Cat('111111','asserts/images/loadingPicture.jpeg','demo2','健康',Color(0xFF311B92)),
    Cat('111111','asserts/images/loadingPicture.jpeg','demo3','健康',Color(0xFF311B92)),
    Cat('111111','asserts/images/loadingPicture.jpeg','demo4','健康',Color(0xFF311B92)),
    Cat('111111','asserts/images/loadingPicture.jpeg','demo5','健康',Color(0xFF311B92)),
    Cat('111111','asserts/images/loadingPicture.jpeg','demo6','健康',Color(0xFF311B92)),

  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          itemCount: catItemList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return CatItem(
              size: size,
              cat: catItemList[index],
            );
         },
        ),
      ),
    );
  }
}

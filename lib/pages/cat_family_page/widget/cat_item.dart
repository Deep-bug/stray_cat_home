import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/cat_family_page/controller/c_list_entity.dart';

class CatItem extends StatelessWidget {
  const CatItem(
      {
        Key? key,
        required this.size,
        //required this.cat,
        required this.catBasic
     }
  ) : super(key: key);
  final Size size;
 // final Cat cat;
  final CListCatBasic catBasic;
  @override
  Widget build(BuildContext context) {
    //InWell有一段交互动画
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              //return CatItemDetailScreen();
              return const Text("ssss");
            },
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: (size.width - 45) / 2,
            height: (size.width - 45) / 2,
            decoration: BoxDecoration(
              //color: cat.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: FadeInImage.assetNetwork(
              image:catBasic.imageUrl.toString(),
              placeholder: 'asserts/images/loadingPicture.jpeg',
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            catBasic.name.toString(),
            style: const TextStyle(
              fontSize: 14,
             // color: mScroudTextColor,
            ),
          ),
          Text(
            catBasic.state.toString(),
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

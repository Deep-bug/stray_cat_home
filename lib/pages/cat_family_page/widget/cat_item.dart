import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_entity.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_list_model.dart';

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
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(16),
            ),
            child: FadeInImage.assetNetwork(
              image:catModel.imageurl,
              placeholder: 'asserts/images/loadingPicture.jpeg',
              fit: BoxFit.cover,
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

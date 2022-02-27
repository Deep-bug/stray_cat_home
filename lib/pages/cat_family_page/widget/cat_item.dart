import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_entity.dart';

class CatItem extends StatelessWidget {
  const CatItem(
      {
        Key? key,
        required this.size,
        required this.cat,
     }
  ) : super(key: key);
  final Size size;
  final Cat cat;
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
              color: cat.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              cat.imageUrl,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            cat.name,
            style: const TextStyle(
              fontSize: 14,
             // color: mScroudTextColor,
            ),
          ),
          Text(
            cat.State,
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stray_cat_home/util/theme.dart';

import 'community_card_controller.dart';

//GetSaveView<CommunityCardController>
class CommunityMesageDetailCard extends StatefulWidget {
  const CommunityMesageDetailCard({Key? key}) : super(key: key);

  @override
  State<CommunityMesageDetailCard> createState() =>
      _communityMesageDetailCardState();
}

class _communityMesageDetailCardState extends State<CommunityMesageDetailCard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              ///封面图
              FadeInImage.assetNetwork(
                width: 400,
                height: 550,
                image:
                    'http://101.132.45.190:9000/starycathome/784dd8fd20c140d4aac2a3776ca68357.png',
                fit: BoxFit.cover,
                placeholder: 'asserts/images/myhead.png' /* 占位图 */,
              ),
              ///标题
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10.0),
                child: Text("正要事情说三遍！！！！",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                    )),
              ),
              ///正文
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10.0),
                child: Text("萨克哈来设计达拉斯大家哈数据库表参考价值性别翠娥u呃呃啊比ABC把白菜",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
        ));
  }

  AppBar buildAppBar(context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: primary,
      actions: <Widget>[
        Row(
          children: [
            ///头像
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage.assetNetwork(
                image: 'https://ooo.0o0.ooo/2019/04/28/5cc5a71a6e3b6.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                placeholder:
                    'asserts/images/3.0x/application_icon.png' /* 占位图 */,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text('管理员',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                )
                //  overflow: TextOverflow.ellipsis,
                ),
            const SizedBox(
              width: 150,
            ),
          ],
        ),
      ],
    );
  }
}

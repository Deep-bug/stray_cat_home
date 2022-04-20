import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:stray_cat_home/base/get/get_save_state_view.dart';
import 'package:stray_cat_home/util/theme.dart';
import 'package:stray_cat_home/widget/detail_refresh_widget.dart';

import 'community_card_controller.dart';

//GetSaveView<CommunityCardController>
class CommunityMesageDetailCard extends GetSaveView<CommunityCardController> {
  const CommunityMesageDetailCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
        body: SafeArea(
        child: DetailRefreshWidget<CommunityCardController>(
        // backgroundColor: Colors.white,

        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              ///封面图
              // AspectRatio(
              //
              //     aspectRatio: 16 / 9,
             Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                            // width: 400,
                            //  height: 550,
                          image: controller.cmuDetail.cmuPids[index],
                          placeholder: 'asserts/images/loadingPicture.jpeg',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    itemCount: controller.cmuDetail.cmuPids.length,
                    pagination: const SwiperPagination(),
                     itemHeight: 550.0,
                     itemWidth: 700.0,
                    layout: SwiperLayout.TINDER,
                    autoplay: false,
                  ),
              // FadeInImage.assetNetwork(
              //   width: 400,
              //   height: 550,
              //   image:
              //       'http://101.132.45.190:9000/starycathome/784dd8fd20c140d4aac2a3776ca68357.png',
              //   fit: BoxFit.cover,
              //   placeholder: 'asserts/images/myhead.png' /* 占位图 */,
              // ),

              ///标题
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    controller.cmuDetail.title,
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
                child: Text(
                    controller.cmuDetail.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
        )),),);
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
                image: controller.cmuDetail.avater,
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
            Text(
                controller.cmuDetail.nickname,
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

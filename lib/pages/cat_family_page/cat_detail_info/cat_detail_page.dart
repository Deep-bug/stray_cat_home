import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:stray_cat_home/base/get/get_save_state_view.dart';
import 'package:stray_cat_home/pages/cat_family_page/widget/cat_gender.dart';
import 'package:stray_cat_home/pages/cat_family_page/widget/detail_weight.dart';

import 'package:stray_cat_home/widget/detail_refresh_widget.dart';

import 'cat_Info_detail_controller.dart';

// GetCommonView<CatInfoDetailController>
class CatInfoDetail extends GetSaveView<CatInfoDetailController> {
  const CatInfoDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: DetailRefreshWidget<CatInfoDetailController>(
        child: Container(
          color: Colors.amberAccent,
            child: Scaffold(
      appBar: AppBar(
        title: Text(controller.catInfoDetailModel.catname),
      ),
      body: Column(

        children: <Widget>[
          Container(
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage.assetNetwork(
                        image: controller.catInfoDetailModel.catpids[index],
                        placeholder: 'asserts/images/loadingPicture.jpeg',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  itemCount: controller.catInfoDetailModel.catpids.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                  itemHeight: 300.0,
                  itemWidth: 400.0,
                  layout: SwiperLayout.TINDER,
                  autoplay: false,
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          // Container(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                '       介绍',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: double.infinity,
                // margin: const EdgeInsets.only(top: 35),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  color: Colors.blueAccent,
                  //z轴的高度，设置card的阴影
                  elevation: 20.0,
                  //设置shape，这里设置成了R角
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(20.0)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: getChild(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  DetailGender(
                    gender: controller.catInfoDetailModel.catgender,
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  DetailWeight(
                    weight: controller.catInfoDetailModel.catweight,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  const Text(
                    '健康状态 :',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  ///状态列表
                  Text(
                    controller.catInfoDetailModel.statelist,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 80,
          ),
          //救助机构
          Text(
            "此信息是由二工大的喵流浪猫管理组织收集",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          )
          //  )
        ],
      ),
    ))));
  }

  getChild() {
    return Container(
      color: Colors.deepPurpleAccent,
      width: 280,
      height: 220,
      alignment: Alignment.topRight,
      child: Text(
        controller.catInfoDetailModel.catdesc,
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
    );
  }
}

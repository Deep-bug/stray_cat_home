import 'package:flutter/material.dart';
import 'package:stray_cat_home/base/get/get_common_view.dart';
import 'package:stray_cat_home/pages/community_page/push_page/push_controller.dart';
import 'package:stray_cat_home/pages/community_page/push_page/widget/push_photo_select_widget.dart';
import 'package:stray_cat_home/res/colors.dart';
import 'package:stray_cat_home/res/style.dart';
import 'package:stray_cat_home/widget/_toolbar.dart';

/// @name : lairenlong
/// @description :动态发布页面
class PushPage extends GetCommonView<PushController> {
  const PushPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///标题栏
              ToolBar(
                title: '记录它的每一时刻',
              ),

              /// 标题
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Container(
                    child: Text(
                      '发布文字',
                      style: Styles.style_1A2F51_14,
                    ),
                    margin: const EdgeInsets.only(top: 25, left: 25),
                  ),

                  ///描述文字
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.left,
                      autofocus: false,
                      onChanged: (text) {
                        controller
                          ..issue = text
                          ..update();
                      },
                      maxLines: 6,
                      maxLength: 200,
                      style: Styles.style_1A2F51_14,
                      decoration: InputDecoration(
                        hintText: '输入您的文字描述',
                        hintStyle: Styles.style_B8C0D4_13,
                        border: _getEditBorder(),
                        focusedBorder: _getEditBorder(),
                        disabledBorder: _getEditBorder(),
                        enabledBorder: _getEditBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
                  ),

                  ///上传图片
                  Container(
                    child: Row(
                      children: [
                        Text(
                          '上传图片',
                          style: Styles.style_1A2F51_14,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 20, left: 25),
                  ),

                  ///图片选择框
                  Container(
                    child: const PushPhotoSelectWidget(),
                    margin: const EdgeInsets.only(top: 15, right: 18, left: 18),
                  ),

                  ///联系方式
                  Container(
                    child: Row(
                      children: [
                        Text(
                          '填写标题',
                          style: Styles.style_1A2F51_14,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 30, left: 25),
                  ),

                  Container(
                    child: TextField(
                      textAlign: TextAlign.left,
                      autofocus: false,
                      maxLines: 1,
                      style: Styles.style_1A2F51_14,
                      onChanged: (text) {
                        controller
                          ..title = text
                          ..update();
                      },
                      decoration: InputDecoration(
                        hintText: '为你的动态填写标题吧',
                        hintStyle: Styles.style_B8C0D4_13,
                        border: _getEditBorder(),
                        focusedBorder: _getEditBorder(),
                        disabledBorder: _getEditBorder(),
                        enabledBorder: _getEditBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 11),
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
                  ),

                  Box.vBox50,

                  GestureDetector(
                      onTap: () => controller.requestFeedback(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorStyle.color_B8C0D4, width: 1.0),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Text(
                          '发布',
                          style: Styles.style_1A2F51_14,
                        ),
                        margin: const EdgeInsets.only(left: 90, right: 110),
                      ))
                ],
              )
            ],
          ),
        ));
  }

  ///获取输入框的Border属性，可公用
  OutlineInputBorder _getEditBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: ColorStyle.color_B8C0D4,
        width: 1.0,
      ),
    );
  }
}

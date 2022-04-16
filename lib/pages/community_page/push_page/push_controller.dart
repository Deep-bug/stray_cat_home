
import 'dart:io';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stray_cat_home/base/get/get_extension.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stray_cat_home/base/get/getx_controller_inject.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/util/keyboard_util.dart';
import 'package:stray_cat_home/util/totast_util.dart';

class PushController extends BaseGetController {

  ///存储本地选择的图片
  List<File> photoEntity = [];
  ///文字描述
  String issue = '';
  ///标题
  String title= '';



  /// 打开相册
  /// [index] 索引
  openGallery(int index) async {
    if (photoEntity.length >= 4) {
      ToastUtils.show(StringStyles.feedbackToast.tr);
      return;
    }
    if (index == photoEntity.length) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        photoEntity.add(File(image.path));
      }
      update();
    }
  }

  ///由于没有反馈接口，因此延时2秒进行操作
  requestFeedback(BuildContext context){
    debugPrint("feedback >> issue == $issue");
    debugPrint("feedback >> contact == $title");
    debugPrint("feedback >> photo == $photoEntity");
    if(issue.isEmpty){
      ToastUtils.show('文字描述不能为空');
      return;
    }
    KeyboardUtils.hideKeyboard(context);
    Get.showLoading();
    Future.delayed(const Duration(seconds: 2)).then((value){
      Get.dismiss();
      ToastUtils.show('动态发布成功');
      Get.back();
    });
  }

}

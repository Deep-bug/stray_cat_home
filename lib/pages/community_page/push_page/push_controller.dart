
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stray_cat_home/base/get/get_extension.dart';
import 'package:stray_cat_home/base/get/getx_controller_inject.dart';
import 'package:stray_cat_home/res/strings.dart';
import 'package:stray_cat_home/util/keyboard_util.dart';
import 'package:stray_cat_home/util/sp_util.dart';
import 'package:stray_cat_home/util/totast_util.dart';

class PushController extends BaseGetController {

  ///存储本地选择的图片
  List<File> photoEntity = List.empty(growable: true);
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
    ///获取用户信息
    var info = SpUtil.getUserInfo();
    String? uid=info?.id;
    KeyboardUtils.hideKeyboard(context);
    Get.showLoading();
    //request.PushMessage(title,issue,'sssss',1,uid!,photoEntity,success: (data){
    //   ToastUtils.show('动态发布成功');
    // });
    _upLoadImage(uid!);
    Future.delayed(const Duration(seconds: 2)).then((value){
      Get.dismiss();
      Get.back();
    });
  }


  _upLoadImage(String uid) async {
    List<dynamic> _imgListUpload=[];
    photoEntity.forEach((element) {
      debugPrint("图片地址>>"+element.uri.toString());
      _imgListUpload.add(MultipartFile.fromFileSync(element.path,filename: element.path));
    });
    FormData formData = FormData.fromMap({
      "uid": uid,
      "files": _imgListUpload,
      'title': title,
      'content': issue,
      'CmuClassify': 1,
    });
    try {
      Dio dio = new Dio();

      debugPrint("开始传shu>>----$formData");
      var respone = await dio.post<String>(
         "http://101.132.45.190:8888/cathome/app/v2/community/publishCommunityMessage",
       //   "http://127.0.0.1:8888/cathome/app/v2/community/publishCommunityMessage",
          data: formData);
      if (respone.statusCode == 200) {
        ToastUtils.show('动态发布成功');
      }
    } catch (e) {
      ToastUtils.show('发布错误');
    }
  }
}

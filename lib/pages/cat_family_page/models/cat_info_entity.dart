import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stray_cat_home/util/theme.dart';
class Cat{
  Cat(this.catNumber,this.imageUrl,this.name,this.State,this.background);
  String ?catNumber;
  ///猫咪图片
  String imageUrl;
  ///猫咪姓名
  String name;
  ///猫咪图片根据猫咪状态改变
  Color? background=primary;
  ///猫咪状态
  String State;
}
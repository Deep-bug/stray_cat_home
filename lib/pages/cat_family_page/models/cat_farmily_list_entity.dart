import 'dart:convert';
import 'package:stray_cat_home/generated/json/base/json_field.dart';
import 'package:stray_cat_home/generated/json/cat_farmily_list_entity.g.dart';
import 'cat_info_entity.dart';

@JsonSerializable()
class CatFarmilyListEntity {

	List<Cat>? result;
  
  CatFarmilyListEntity();

  factory CatFarmilyListEntity.fromJson(Map<String, dynamic> json) => $CatFarmilyListEntityFromJson(json);

  Map<String, dynamic> toJson() => $CatFarmilyListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
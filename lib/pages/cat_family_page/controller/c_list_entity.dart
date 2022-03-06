import 'dart:convert';
import 'dart:ui';
import 'package:stray_cat_home/generated/json/base/json_field.dart';
import 'package:stray_cat_home/generated/json/c_list_entity.g.dart';
import 'package:stray_cat_home/util/theme.dart';

@JsonSerializable()
class CListEntity {

	List<CListCatBasic>? catBasicList;
  
  CListEntity();

  factory CListEntity.fromJson(Map<String, dynamic> json) => $CListEntityFromJson(json);

  Map<String, dynamic> toJson() => $CListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CListCatBasic {

	String? catNumber;
	String? imageUrl;
	String? name;
	String? state;
	Color?  color=primary;
  
  CListCatBasic();

  factory CListCatBasic.fromJson(Map<String, dynamic> json) => $CListCatBasicListFromJson(json);

  Map<String, dynamic> toJson() => $CListCatBasicListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
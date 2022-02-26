import 'dart:convert';
import 'package:stray_cat_home/generated/json/base/json_field.dart';
import 'package:stray_cat_home/generated/json/access_token_entity.g.dart';

@JsonSerializable()
class AccessTokenEntity {

	String? isNew;
	String? token;
  
  AccessTokenEntity();

  factory AccessTokenEntity.fromJson(Map<String, dynamic> json) => $AccessTokenEntityFromJson(json);

  Map<String, dynamic> toJson() => $AccessTokenEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
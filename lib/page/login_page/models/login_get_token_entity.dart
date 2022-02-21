import 'dart:convert';
import 'package:stray_cat_home/generated/json/base/json_field.dart';
import 'package:stray_cat_home/generated/json/login_get_token_entity.g.dart';

@JsonSerializable()
class LoginGetTokenEntity {

	String? username;
	String? password;
  
  LoginGetTokenEntity();

  factory LoginGetTokenEntity.fromJson(Map<String, dynamic> json) => $LoginGetTokenEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginGetTokenEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
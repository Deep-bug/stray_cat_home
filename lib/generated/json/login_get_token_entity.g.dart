import 'package:stray_cat_home/generated/json/base/json_convert_content.dart';
import 'package:stray_cat_home/pages/login_page/models/login_get_token_entity.dart';

LoginGetTokenEntity $LoginGetTokenEntityFromJson(Map<String, dynamic> json) {
	final LoginGetTokenEntity loginGetTokenEntity = LoginGetTokenEntity();
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		loginGetTokenEntity.username = username;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		loginGetTokenEntity.password = password;
	}
	return loginGetTokenEntity;
}

Map<String, dynamic> $LoginGetTokenEntityToJson(LoginGetTokenEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['username'] = entity.username;
	data['password'] = entity.password;
	return data;
}
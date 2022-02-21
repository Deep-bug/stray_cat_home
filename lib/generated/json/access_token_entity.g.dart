import 'package:stray_cat_home/generated/json/base/json_convert_content.dart';
import 'package:stray_cat_home/page/login_page/models/access_token_entity.dart';

AccessTokenEntity $AccessTokenEntityFromJson(Map<String, dynamic> json) {
	final AccessTokenEntity accessTokenEntity = AccessTokenEntity();
	final String? isNew = jsonConvert.convert<String>(json['isNew']);
	if (isNew != null) {
		accessTokenEntity.isNew = isNew;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		accessTokenEntity.token = token;
	}
	return accessTokenEntity;
}

Map<String, dynamic> $AccessTokenEntityToJson(AccessTokenEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['isNew'] = entity.isNew;
	data['token'] = entity.token;
	return data;
}
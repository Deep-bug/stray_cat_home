import 'package:stray_cat_home/generated/json/base/json_convert_content.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_farmily_list_entity.dart';
import 'package:stray_cat_home/pages/cat_family_page/models/cat_info_entity.dart';

CatFarmilyListEntity $CatFarmilyListEntityFromJson(Map<String, dynamic> json) {
	final CatFarmilyListEntity catFarmilyListEntity = CatFarmilyListEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	final List<Cat>? result = jsonConvert.convertListNotNull<Cat>(json['result']);
	if (result != null) {
		catFarmilyListEntity.result = result;
	}
	return catFarmilyListEntity;
}

Map<String, dynamic> $CatFarmilyListEntityToJson(CatFarmilyListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['result'] =  entity.result;
	return data;
}
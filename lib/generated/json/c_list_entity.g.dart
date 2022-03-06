import 'package:stray_cat_home/generated/json/base/json_convert_content.dart';
import 'package:stray_cat_home/pages/cat_family_page/controller/c_list_entity.dart';

CListEntity $CListEntityFromJson(Map<String, dynamic> json) {
	final CListEntity cListEntity = CListEntity();
	final List<CListCatBasic>? catBasicList = jsonConvert.convertListNotNull<CListCatBasic>(json['catBasicList']);
	if (catBasicList != null) {
		cListEntity.catBasicList = catBasicList;
	}
	return cListEntity;
}

Map<String, dynamic> $CListEntityToJson(CListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['catBasicList'] =  entity.catBasicList?.map((v) => v.toJson()).toList();
	return data;
}

CListCatBasic $CListCatBasicListFromJson(Map<String, dynamic> json) {
	final CListCatBasic cListCatBasicList = CListCatBasic();
	final String? catNumber = jsonConvert.convert<String>(json['catNumber']);
	if (catNumber != null) {
		cListCatBasicList.catNumber = catNumber;
	}
	final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
	if (imageUrl != null) {
		cListCatBasicList.imageUrl = imageUrl;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		cListCatBasicList.name = name;
	}
	final String? state = jsonConvert.convert<String>(json['state']);
	if (state != null) {
		cListCatBasicList.state = state;
	}
	return cListCatBasicList;
}

Map<String, dynamic> $CListCatBasicListToJson(CListCatBasic entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['catNumber'] = entity.catNumber;
	data['imageUrl'] = entity.imageUrl;
	data['name'] = entity.name;
	data['state'] = entity.state;
	return data;
}
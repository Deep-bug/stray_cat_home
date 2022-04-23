class UserEntity{
  String sex ='';
  String id = '';
  String token = '';
  String mobile='';
  ///用户名
  String username= '';
  ///昵称
  String nickname='';
  ///用户类型 0普通用户 1管理员
  int type = 0;
  ///头像url
  String avatar='';
  String password='';

  UserEntity({
    required this.sex,
    required this.username,
    required this.id,
    required this.avatar,
    required this.nickname,
    required this.token,
    required this.type,
    required this.mobile,
    required this.password,
  });

  UserEntity.fromJson(Map<dynamic,dynamic> json){
    sex=json["sex"].toString();
    username=json["username"].toString();
    id=json["id"].toString();
    avatar=json["avatar"].toString();
    nickname=json["nickname"].toString();
    token=json["token"].toString();
    type=json["type"].toInt();
    mobile=json["mobile"].toString();
    password=json["password"].toString();
    // sex=json["sex"];
    // username=json["username"];
    // id=json["id"];
    // avatar=json["avatar"];
    // nickname=json["nickname"];
    // token=json["token"];
    // type=json["type"];
    // mobile=json["mobile"];
    // password=json["password"];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['avatar'] = avatar;
    data['id'] = id;
    data['mobile'] = mobile;
    data['nickname'] = nickname;
    data['sex'] = sex;
    data['token'] = token;
    data['username'] = username;
    data["type"]=type;
    data["password"]=password;
    return data;
  }


}
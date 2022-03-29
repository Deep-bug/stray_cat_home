class CatListPage{
    ///列表数量
    int total=0;
    ///条件筛选列表
    List catBasicList=[];

    CatListPage({
        required this.total,
        required this.catBasicList,
    });

    CatListPage.fromJson(Map<dynamic,dynamic> json){
        total=json['total'];
        catBasicList=json["catBasicList"];
    }


}




class CatListModel {
    String catnumber='007';
    String imageurl='http://101.132.45.190:9000/cathomeapp/36226cba05b5427abdfbb04d0abd6bbe.jpg';
    String name='我是一只待加载猫猫';
    String state='健康';
    // bool collect=false;
    CatListModel({required this.catnumber,  required this.imageurl,  required this.name,  required this.state});

    factory CatListModel.fromJson(Map<String, dynamic> json) {
        return CatListModel(
            catnumber: json['catnumber'].toString(),
            imageurl: json['imageurl'].toString(),
            name: json['name'].toString(),
            state: json['state'].toString(),
            // collect : json['collect']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['catnumber'] = this.catnumber;
        data['imageurl'] = this.imageurl;
        data['name'] = this.name;
        data['state'] = this.state;
        return data;
    }
}
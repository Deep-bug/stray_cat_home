class CommunityItem {
    String avater='';
    int cmuClassify=1;
    String cmuPids='';
    String id='';
    String nickname='';
    String title='';

    // ///分页数据
    // int curPage=0;
    // List datas=[];
    // int offset=0;
    // bool over=false;
    // int pageCount=0;
    // int size=0;
    // int total=0;

    CommunityItem({required this.avater, required this.cmuClassify, required this.cmuPids, required this.id, required this.nickname, required this.title});

    CommunityItem.fromJson(Map<dynamic, dynamic> json) {
            avater=json['avater'];
            cmuClassify=json['cmuClassify'];
            cmuPids=json['cmuPids'];
            id=json['id'];
            nickname=json['nickname'];
            title=json['title'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avater'] = this.avater;
        data['cmuClassify'] = this.cmuClassify;
        data['cmuPids'] = this.cmuPids;
        data['id'] = this.id;
        data['nickname'] = this.nickname;
        data['title'] = this.title;
        return data;
    }
}
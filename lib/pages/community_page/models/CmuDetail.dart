class CmuDetail {
    String avater="";
    int cmuClassify=1;
    List cmuPids=[];
    String content="";
    String id="";
    String nickname="";
    String title="";
    String uid="";

    CmuDetail({required this.avater, required this.cmuClassify, required this.cmuPids, required this.content, required this.id, required this.nickname, required this.title, required this.uid});

     CmuDetail.fromJson(Map<dynamic, dynamic> json) {
            avater=json['avater'];
            cmuClassify=json['cmuClassify'];
            cmuPids=json['cmuPids'];
            content=json['content'];
            id=json['id'];
            nickname=json['nickname'];
            title=json['title'];
            uid=json['uid'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avater'] = this.avater;
        data['cmuClassify'] = this.cmuClassify;
        data['content'] = this.content;
        data['id'] = this.id;
        data['nickname'] = this.nickname;
        data['title'] = this.title;
        data['uid'] = this.uid;
        if (this.cmuPids != null) {
            data['cmuPids'] = this.cmuPids;
        }
        return data;
    }
}
class CatInfoDetailModel {
    String catcharacter="";
    String catdesc="";
    String catgender="";
    String catname="";
    double catweight=0;
    String id="";
    String locationid="";

    //猫咪图集
    List catpids=[];
    String statelist="";


    CatInfoDetailModel({required this.catcharacter, required this.catdesc, required this.catgender, required this.catname, required this.catweight, required this.id,required this.catpids,required this.statelist });

     CatInfoDetailModel.fromJson(Map<dynamic, dynamic> json) {

            catcharacter=json['catcharacter'];
            catdesc= json['catdesc'];
            catgender= json['catgender'];
            catname=json['catname'];
            catweight= json['catweight'];
            id=json['id'];
            // locationid: json['locationid'],
            catpids=json['catpids'];
            statelist=json['statelist'];

    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['catcharacter'] = this.catcharacter;
        data['catdesc'] = this.catdesc;
        data['catgender'] = this.catgender;
        data['catname'] = this.catname;
        data['catweight'] = this.catweight;
        data['id'] = this.id;
        // data['locationid'] = this.locationid;
        return data;
    }
}
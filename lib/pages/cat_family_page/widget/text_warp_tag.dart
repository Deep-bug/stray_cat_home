//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_tag_layout/flutter_tag_layout.dart';
//
// class TextWarpTagPage extends StatefulWidget {
//   const TextWarpTagPage({Key? key}) : super(key: key);
//
//   @override
//   State<TextWarpTagPage> createState() => _TextWarpTagPageState();
// }
// List<String> stateList=["已打疫苗","已绝育","健康"];
// class _TextWarpTagPageState extends State<TextWarpTagPage> {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> itemWidgetList=[];
//     for(var i=0;i<stateList.length;i++){
//       var str =stateList[i];
//       itemWidgetList.add(TextTagWidget("$str"));
//     }
//    return Container(
//      margin: EdgeInsets.only(top:30.0,left: 10,right: 10),
//      child: Wrap(
//        spacing: 8.0,
//        runSpacing: 8.0,
//        children: itemWidgetList,
//      ),
//    );
//   }
// }
//

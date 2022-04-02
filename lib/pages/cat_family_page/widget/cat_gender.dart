import 'package:flutter/cupertino.dart';

class DetailGender extends StatelessWidget {
   DetailGender(
      {Key? key, required this.gender}) : super(key: key);
   final String  gender;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('性别',style: TextStyle(
            fontSize: 20,

          ),),
          SizedBox(height: 6,),
          Text(
            gender,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]);
  }
}

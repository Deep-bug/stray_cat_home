import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailWeight extends StatelessWidget {
   DetailWeight({Key? key,required this.weight}) : super(key: key);
final double weight;
  @override
  Widget build(BuildContext context) {
    var weight=12.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('体重',style: TextStyle(
          fontSize: 20,

        ),),
        SizedBox(height: 6,),
        Text(
          weight.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:notes_ios/utils/sizeconfig.dart';

class text_medium extends StatelessWidget {
  final String text;
  final double textSize;
  final Color colors;
  bool isDecoration;

   text_medium({ required this.text, this.textSize=13, this.colors=Colors.black,this.isDecoration = false});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w500,
        fontSize: SizeConfig.scaleTextFont(textSize),
        color: colors,
      decoration: isDecoration?TextDecoration.lineThrough:TextDecoration.none
         ),);
  }
}
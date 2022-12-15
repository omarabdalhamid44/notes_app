
import 'package:flutter/material.dart';
import 'package:notes_ios/utils/sizeconfig.dart';

class Text_Light extends StatelessWidget {
 final String text;
 final double textSize;
 final Color color;
 final FontWeight textWeight;

  const Text_Light({ required this.text, this.textSize=15, this.color=Colors.white , this.textWeight= FontWeight.w300});

  @override
  Widget build(BuildContext context) {
    return Text(text ,
     style:TextStyle(
        fontFamily: 'Roboto',
        fontWeight: textWeight,
        fontSize: SizeConfig.scaleTextFont(textSize),
        color: color,
    ));
  }
}
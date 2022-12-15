
import 'package:flutter/material.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/sizeconfig.dart';

class Text_bold extends StatelessWidget {
 final String text;
 final double textSize;
//  final Color color;

   Text_bold({ required this.text, this.textSize=25}) ;

  @override
  Widget build(BuildContext context) {
    return Text(text ,
     style:TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: SizeConfig.scaleTextFont(textSize),
        color: App_Color.FONT_BOLD_COLOR,
    ));
  }
}
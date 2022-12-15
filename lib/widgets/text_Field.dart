
import 'package:flutter/material.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/sizeconfig.dart';

class TextField_ extends StatelessWidget {

  final String hintText;
  final TextEditingController? editingController;

  const TextField_({required this.hintText,
   this.editingController
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: SizeConfig.scaleWidth(30),right:  SizeConfig.scaleWidth(30) , top: SizeConfig.scaleHeight(38)),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w300,
           fontSize: SizeConfig.scaleTextFont(22),
           color: App_Color.TEXT_FIELD_HINT_COLOR),
           enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0 , color: Colors.transparent)),
           focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0 , color: Colors.transparent)),
           disabledBorder:  UnderlineInputBorder(borderSide: BorderSide(width: 0 , color: Colors.transparent)),
      ),

    );
  }
}


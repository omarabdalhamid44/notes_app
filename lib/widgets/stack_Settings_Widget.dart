

import 'package:flutter/material.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/widgets/text_medium.dart';

class stack_Settings_widget extends StatelessWidget {
  final String title;
  final String sub_title;
  final IconData icons;
  final bool isLeft ;
    final bool isRight ;
    final Function() x;


  const stack_Settings_widget({required this.title,
  required this.sub_title,
  required this.icons,
   this.isLeft=true,
   this.isRight= true,
   required this.x,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 70,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                      blurRadius: 5,
                      color: Colors.black
              )
            ]
          ),
          child: ListTile(
            onTap: x,
            leading: CircleAvatar(
              radius: 40,
              backgroundColor: App_Color.BUTTON_COLOR,
              child: Icon(icons ,color: Colors.white,),
            ),
            title: text_medium(text: title),
            subtitle: text_medium(text: sub_title ,textSize: 12,colors: App_Color.FONT_LIGHT_COLOR,),
            trailing:Icon(Icons.arrow_forward_ios,color: Colors.black),
            
            ),
        ),
        Positioned(
          left:0.5,
          child: Container(
            width: 4,
            height: 70,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
            color: isLeft?App_Color.BUTTON_COLOR:Colors.transparent,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20) , bottomLeft: Radius.circular(20)),
            ),
          ),
        ),
        Positioned(
          right: 0.5,
          child: Container(
            width: 4,
            height: 70,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
            color: isRight?App_Color.BUTTON_COLOR:Colors.transparent,
            borderRadius: BorderRadius.only(topRight:Radius.circular(20) , bottomRight: Radius.circular(20)),
            )
            ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/widgets/background_screens.dart';
import 'package:notes_ios/widgets/color_background_screens.dart';
import 'package:notes_ios/widgets/text_bold.dart';
import 'package:notes_ios/widgets/text_light.dart';
import 'package:notes_ios/widgets/text_medium.dart';
class About_Screen extends StatefulWidget {
  const About_Screen({ Key? key }) : super(key: key);

  @override
  _About_ScreenState createState() => _About_ScreenState();
}

class _About_ScreenState extends State<About_Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background_Screens(),
        color_background_screens(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
                title: text_medium(text: 'About App' , colors: Colors.black,),
                iconTheme:IconThemeData(color: Colors.black),
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
          ),
          body: Stack(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                            width: 4,
                  
                          )
                        ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: App_Color.BACKGROUND_LOGO_COLOR
                            
                            ),
                            child: Image.asset('images/logo.png' , height: 77, width: 88,),
                          ),
                           SizedBox(height: 20,),
                  Text_bold(text: 'My Notes',),
                     SizedBox(height: 8,),
                  Text_Light(text: 'For Organized Life',color: App_Color.FONT_LIGHT_COLOR,),
          
                      ],
                    ),
                  ), 
                   
                        
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(padding:EdgeInsets.only(bottom: 15),
                  child: Text_Light(text: 'iOS Course - Notes App V1.0',color: App_Color.FONT_LIGHT_COLOR,)),
              ),
            ],
          ),
      
        ),
      ],
    );
  }
}
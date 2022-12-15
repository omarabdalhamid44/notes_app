import 'package:flutter/material.dart';
import 'package:notes_ios/storge/db_Provider.dart';
import 'package:notes_ios/storge/sharedPref.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/sizeconfig.dart';
import 'package:notes_ios/widgets/background_screens.dart';
import 'package:notes_ios/widgets/color_background_screens.dart';
import 'package:notes_ios/widgets/text_bold.dart';
import 'package:notes_ios/widgets/text_light.dart';

class Lanach_Screen extends StatefulWidget {
  const Lanach_Screen({ Key? key }) : super(key: key);

  @override
  _Lanach_ScreenState createState() => _Lanach_ScreenState();

}

class _Lanach_ScreenState extends State<Lanach_Screen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    SizeConfig.init(context);
  }
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      String route = SharedPrefContraller().loggedIn ? '/categories_Screen' : '/login_Screen';
    Navigator.pushReplacementNamed(context, route);

    });

      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
          children: [
           background_Screens(),
           color_background_screens(),
          Positioned(
            left: SizeConfig.scaleWidth(125),
            right: SizeConfig.scaleWidth(125),
            top: SizeConfig.scaleHeight(250) ,
            child: Column(
              // mainAxisSize:MainAxisSize.min,
              children: [
                Container(
                  height: SizeConfig.scaleHeight(120),
                  width: SizeConfig.scaleWidth(120),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: App_Color.BACKGROUND_LOGO_COLOR
                    
                    ),
                    child: Image.asset('images/logo.png' , height: SizeConfig.scaleHeight(77), width: SizeConfig.scaleWidth(88)),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(20)),
                    Text_bold(text: 'My Notes',),
                   SizedBox(height: SizeConfig.scaleHeight(8)),
                    Text_Light(text: 'For Organized Life',color: App_Color.FONT_LIGHT_COLOR,),
     
                      
              ],
            ),
          ),
         Align(
           alignment: AlignmentDirectional.bottomCenter,
           child: Container(padding:EdgeInsets.only(bottom: SizeConfig.scaleHeight(15)),
             child: Text_Light(text: 'iOS Course - Notes App V1.0',color: App_Color.FONT_LIGHT_COLOR,))),
          
          ],),
    );
      
    
  }}


import 'package:flutter/material.dart';
import 'package:notes_ios/storge/sharedPref.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/helpers.dart';
import 'package:notes_ios/utils/sizeconfig.dart';
import 'package:notes_ios/widgets/stack_Settings_Widget.dart';
import 'package:notes_ios/widgets/text_Field.dart';
import 'package:notes_ios/widgets/text_bold.dart';
import 'package:notes_ios/widgets/text_light.dart';
import 'package:notes_ios/widgets/text_medium.dart';

class Setting_Screen extends StatefulWidget {
  const Setting_Screen({ Key? key }) : super(key: key);

  @override
  _Setting_ScreenState createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> with Helpers{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleTextFont(22),
          color: App_Color.FONT_BOLD_COLOR
        ),),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: SizeConfig.scaleWidth(70),
                height: SizeConfig.scaleHeight(70),
                decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  color: App_Color.BUTTON_COLOR

                ),
                child: Center(child: text_medium(text: 'O' , colors: Colors.white,)),

              ),
              text_medium(text: 'Omar Abd-Alhamid'),
              text_medium(text: 'omarabdalhamid44@gmail.com'),
              Divider(color: Colors.grey, thickness: 0.5, indent: 27, endIndent: 27, height: SizeConfig.scaleHeight(20)),
              Padding(
                padding:  EdgeInsets.only(right: SizeConfig.scaleWidth(18) ,left: SizeConfig.scaleWidth(18) , top:SizeConfig.scaleHeight(15)),
                child: Column(
                  children: [
                    stack_Settings_widget(title: 'Language', sub_title: 'Selected language: EN', icons: Icons.language ,
                     isLeft: true, isRight: false, x: (){},),
                    SizedBox(height: SizeConfig.scaleHeight(5)),
                    stack_Settings_widget(title: 'Profile', sub_title: 'Update your data…', icons: Icons.person_outlined ,
                     isLeft: false , isRight: true,x: (){
                       Navigator.pushNamed(context, '/profile_Screen');
                     }),
                    SizedBox(height: SizeConfig.scaleHeight(5)),
                    stack_Settings_widget(title: 'About App', sub_title: 'What is notes app?', icons: Icons.info_outline ,
                     isLeft: true,isRight: false,x: (){
                                          Navigator.pushNamed(context, '/about_Screen');

                     }),
                    SizedBox(height: SizeConfig.scaleHeight(5)),
                    stack_Settings_widget(title: 'About course', sub_title: 'Describe the course in brief', icons: Icons.info_outline,
                     isLeft: false,isRight: true,x: (){}),
                    SizedBox(height: SizeConfig.scaleHeight(5)),
                    stack_Settings_widget(title: 'Logout', sub_title: 'Logout', icons: Icons.logout_outlined, 
                    isLeft: true, isRight: false,x: (){
                          SharedPrefContraller().clear();
                          Navigator.pushReplacementNamed(context, '/login_Screen');
                         showSnackBar(context, 'Log out Is successfuly');
                        }),
                                    SizedBox(height: SizeConfig.scaleHeight(5)),

                   
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(100)),
               Align(
                 alignment:Alignment.bottomCenter,
                 child: Container(
                   padding:EdgeInsets.only(bottom: SizeConfig.scaleHeight(15)),
                   child: Text_Light(text: 'iOS Course - Notes App V1.0',color: App_Color.FONT_LIGHT_COLOR,)),
               ),
             
            ],
          ),
        ),
      ),
    );
  }
}

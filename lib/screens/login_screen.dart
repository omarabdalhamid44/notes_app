import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:notes_ios/bloc/bloc/User_Bloc.dart';
import 'package:notes_ios/bloc/states/crud_state.dart';
import 'package:notes_ios/getX/user_Getx.dart';
import 'package:notes_ios/notifers/userProviderNotifer.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/helpers.dart';
import 'package:notes_ios/utils/sizeconfig.dart';
import 'package:notes_ios/widgets/background_screens.dart';
import 'package:notes_ios/widgets/color_background_screens.dart';
import 'package:notes_ios/widgets/text_Field.dart';
import 'package:notes_ios/widgets/text_bold.dart';
import 'package:notes_ios/widgets/text_light.dart';
import 'package:provider/provider.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> with Helpers {
  late TapGestureRecognizer _tapGestureRecognizer;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passTextEditingController;

  // User_GetXContoller contoller = Get.put(User_GetXContoller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = go_SignUp_Screen;
    _emailTextEditingController = TextEditingController();
    _passTextEditingController = TextEditingController();
  }

  void go_SignUp_Screen() {
    Navigator.pushNamed(context, '/signUp_Screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<User_BLoc,Crud_State>(
        buildWhen: (previous, current) => current is ListReadState || current is LoadingState,
        builder: (context , state){
          return Stack(
            children: [
              background_Screens(),
              color_background_screens(),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(20),
                      right: SizeConfig.scaleWidth(20),
                      top: SizeConfig.scaleHeight(90)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text_bold(
                        text: 'Sign In',
                      ),
                      Text_Light(
                        text: 'Login to start using app,',
                        textSize: SizeConfig.scaleTextFont(18),
                        color: App_Color.FONT_LIGHT_COLOR,
                      ),
                      SizedBox(height: SizeConfig.scaleHeight(82)),
                      Container(
                          height: SizeConfig.scaleHeight(200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 6)
                            ],
                            color: Colors.white,
                          ),
                          child: Column(children: [
                            TextField_(
                                hintText: 'Email',
                                editingController: _emailTextEditingController),
                            Divider(
                                color: Colors.grey,
                                indent: 30,
                                endIndent: 30,
                                height: SizeConfig.scaleHeight(20)),
                            TextField_(
                                hintText: 'Password',
                                editingController: _passTextEditingController),
                            Divider(
                                color: Colors.grey,
                                indent: 30,
                                endIndent: 30,
                                height: SizeConfig.scaleHeight(20)),
                          ])),
                      SizedBox(height: SizeConfig.scaleHeight(29)),
                      ElevatedButton(
                        onPressed: ()  =>  performLogin(),
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                            primary: App_Color.BUTTON_COLOR,
                            minimumSize:
                            Size(double.infinity, SizeConfig.scaleHeight(54)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                      ),
                      SizedBox(height: SizeConfig.scaleHeight(15)),
                      Center(
                        child: RichText(
                            text: TextSpan(
                                text: 'Don’t have an account? ',
                                style: TextStyle(
                                    color: App_Color.TEXT_FIELD_HINT_COLOR,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeConfig.scaleTextFont(18)),
                                children: [
                                  TextSpan(
                                      recognizer: _tapGestureRecognizer,
                                      text: 'Sign up',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeConfig.scaleTextFont(
                                              18))),
                                ])),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      )
      // body: GetBuilder(
      //   builder: (controller) {
      //     return Stack(
      //       children: [
      //         background_Screens(),
      //         color_background_screens(),
      //         SingleChildScrollView(
      //           child: Padding(
      //             padding: EdgeInsets.only(
      //                 left: SizeConfig.scaleWidth(20),
      //                 right: SizeConfig.scaleWidth(20),
      //                 top: SizeConfig.scaleHeight(90)),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text_bold(
      //                   text: 'Sign In',
      //                 ),
      //                 Text_Light(
      //                   text: 'Login to start using app,',
      //                   textSize: SizeConfig.scaleTextFont(18),
      //                   color: App_Color.FONT_LIGHT_COLOR,
      //                 ),
      //                 SizedBox(height: SizeConfig.scaleHeight(82)),
      //                 Container(
      //                     height: SizeConfig.scaleHeight(200),
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(4),
      //                       boxShadow: [
      //                         BoxShadow(color: Colors.black, blurRadius: 6)
      //                       ],
      //                       color: Colors.white,
      //                     ),
      //                     child: Column(children: [
      //                       TextField_(
      //                           hintText: 'Email',
      //                           editingController: _emailTextEditingController),
      //                       Divider(
      //                           color: Colors.grey,
      //                           indent: 30,
      //                           endIndent: 30,
      //                           height: SizeConfig.scaleHeight(20)),
      //                       TextField_(
      //                           hintText: 'Password',
      //                           editingController: _passTextEditingController),
      //                       Divider(
      //                           color: Colors.grey,
      //                           indent: 30,
      //                           endIndent: 30,
      //                           height: SizeConfig.scaleHeight(20)),
      //                     ])),
      //                 SizedBox(height: SizeConfig.scaleHeight(29)),
      //                 ElevatedButton(
      //                   onPressed: () async => await performLogin(),
      //                   child: Text('Login'),
      //                   style: ElevatedButton.styleFrom(
      //                       primary: App_Color.BUTTON_COLOR,
      //                       minimumSize:
      //                       Size(double.infinity, SizeConfig.scaleHeight(54)),
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(40),
      //                       )),
      //                 ),
      //                 SizedBox(height: SizeConfig.scaleHeight(15)),
      //                 Center(
      //                   child: RichText(
      //                       text: TextSpan(
      //                           text: 'Don’t have an account? ',
      //                           style: TextStyle(
      //                               color: App_Color.TEXT_FIELD_HINT_COLOR,
      //                               fontFamily: 'Roboto',
      //                               fontWeight: FontWeight.w500,
      //                               fontSize: SizeConfig.scaleTextFont(18)),
      //                           children: [
      //                             TextSpan(
      //                                 recognizer: _tapGestureRecognizer,
      //                                 text: 'Sign up',
      //                                 style: TextStyle(
      //                                     color: Colors.black,
      //                                     fontFamily: 'Roboto',
      //                                     fontWeight: FontWeight.w500,
      //                                     fontSize: SizeConfig.scaleTextFont(
      //                                         18))),
      //                           ])),
      //                 )
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     );
      //
      //
      //   },
      // ),
    );
  }

  void performLogin()  {
    if (checkData()) {
       login();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&
        _passTextEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void login() async{
    // bool logged = await Provider.of<UserProvider>(context, listen: false).login(
    //     email: _emailTextEditingController.text,
    //     pass: _passTextEditingController.text);
    bool logged = await BlocProvider.of<User_BLoc>(context).login(email: _emailTextEditingController.text, pass: _passTextEditingController.text);
    if (logged) {
      Navigator.pushReplacementNamed(context, '/categories_Screen');
    }
    String mass = logged ? 'Login Successfuly' : 'Login Failed';
    showSnackBar(context, mass, error: !logged);
  }
}

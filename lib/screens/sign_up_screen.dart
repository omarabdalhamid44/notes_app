import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_ios/bloc/bloc/User_Bloc.dart';
import 'package:notes_ios/bloc/events/crud_events.dart';
import 'package:notes_ios/bloc/states/crud_state.dart';
import 'package:notes_ios/getX/user_Getx.dart';
import 'package:notes_ios/models/user.dart';
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

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({Key? key}) : super(key: key);

  @override
  _SignUp_ScreenState createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> with Helpers {
  late TextEditingController _emailEditingController;
  late TextEditingController _nameEditingController;
  late TextEditingController _passEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailEditingController = TextEditingController();
    _nameEditingController = TextEditingController();
    _passEditingController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      background_Screens(),
      color_background_screens(),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: BlocListener<User_BLoc , Crud_State>(
            listenWhen: (previous, current) => current is ProcessState && current.processType == ProcessType.create,
            listener: (context, state) {
              state as ProcessState;
              showSnackBar(context, state.massage , error: !state.status);
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.scaleWidth(27),
                  right: SizeConfig.scaleWidth(27),
                  top: SizeConfig.scaleHeight(19)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text_bold(text: 'Sign Up'),
                    SizedBox(height: SizeConfig.scaleHeight(10)),
                    Text_Light(
                      text: 'Create an account',
                      textSize: 18,
                      color: App_Color.FONT_LIGHT_COLOR,
                    ),
                    SizedBox(height: SizeConfig.scaleHeight(10)),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                              // height: SizeConfig.scaleHeight(200),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                                child: Column(
                                children: [
                                  TextField_(hintText: 'User Name',editingController: _nameEditingController),
                                  Divider(
                                      color: Colors.grey,
                                      indent: SizeConfig.scaleWidth(30),
                                      endIndent: SizeConfig.scaleWidth(30),
                                      height: SizeConfig.scaleHeight(20)),

                                  TextField_(hintText: 'Email',editingController: _emailEditingController),

                                  Divider(
                                      color: Colors.grey,
                                      indent: SizeConfig.scaleWidth(30),
                                      endIndent: SizeConfig.scaleWidth(30),
                                      height: SizeConfig.scaleHeight(20)),
                                  TextField_(hintText: 'Password',editingController: _passEditingController),
                                  Divider(
                                      color: Colors.grey,
                                      indent: SizeConfig.scaleWidth(30),
                                      endIndent: SizeConfig.scaleWidth(30),
                                      height: SizeConfig.scaleHeight(20)),
                                ],
                              )),
                              SizedBox(height: SizeConfig.scaleHeight(20)),
                              Padding(
                                padding:  EdgeInsets.only(bottom: 10),
                                child: ElevatedButton(
                                  onPressed: () =>  performLogin(),
                                  child: Text('Sign Up'),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                      Size(double.infinity, SizeConfig.scaleHeight(54)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20))),
                                ),
                              ),
                            ],
                          ),
                    ),

                  ],
                ),
              ),
            ),
          )),
    ]);
  }
  void performLogin() {
    if(checkData()){
       regester();
    }
  }
  bool checkData(){
    if(_emailEditingController.text.isNotEmpty&&_passEditingController.text.isNotEmpty&&_nameEditingController.text.isNotEmpty){
      return true;

    }
    else{
      // Helpers.showSnackBar(context, 'Pleace, Enter Data on correct places',error: true);

      return false;
    }
  }
  void regester() {
    // bool regested = await Provider.of<UserProvider>(context,listen: false).create(dataUser);
    // bool regested = await User_GetXContoller.to.create(dataUser);
    BlocProvider.of<User_BLoc>(context).add(Create_Events(dataUser));
    // if(regested){
      Navigator.pop(context);
    // }
    // String mass = regested ? 'Regestrion Successfuly' : 'Regestrion Failed';
    // Helpers.showSnackBar(context, mass,error: !regested);
  }
  User get dataUser{
    User user = User();
      user.name = _nameEditingController.text;
      user.email = _emailEditingController.text;
      user.pass = _passEditingController.text;

    return user;
  }
}

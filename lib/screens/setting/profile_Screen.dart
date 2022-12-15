import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_ios/bloc/bloc/Catagory_Bloc.dart';
import 'package:notes_ios/bloc/bloc/User_Bloc.dart';
import 'package:notes_ios/bloc/events/crud_events.dart';
import 'package:notes_ios/bloc/states/crud_state.dart';
import 'package:notes_ios/models/user.dart';
import 'package:notes_ios/notifers/notifer_Notes.dart';
import 'package:notes_ios/notifers/provider_notifers_catgories.dart';
import 'package:notes_ios/notifers/userProviderNotifer.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/sizeconfig.dart';
import 'package:notes_ios/widgets/text_Field.dart';
import 'package:notes_ios/widgets/text_bold.dart';
import 'package:notes_ios/widgets/text_light.dart';
import 'package:notes_ios/widgets/text_medium.dart';
import 'package:provider/provider.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({ Key? key }) : super(key: key);

  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<User_BLoc>(context).add(Read_Events());
    // Provider.of<UserProvider>(context,listen: false).read();
    // Provider.of<Provider_Notifers_Catgories>(context,listen: false).read();
    BlocProvider.of<Catagory_bloc>(context).add(Read_Events());

    // Provider.of<Provider_Notifers_Notes>(context,listen: false).read();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text_bold(text: 'Profile' , textSize: 22),
        backgroundColor: Colors.white,
        elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      ),
      body: BlocBuilder<User_BLoc , Crud_State>(
        buildWhen: (previous, current) =>current is ListReadState<User> || current is LoadingState,
            builder: (context, state) {
              if(state is ListReadState && state.list.isNotEmpty){
                // print(state.list.first.name.characters.first);

                return SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15),vertical: SizeConfig.scaleHeight(5)),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(right: SizeConfig.scaleWidth(15),left:SizeConfig.scaleWidth(15),top: SizeConfig.scaleHeight(5),bottom: SizeConfig.scaleHeight(5)),
                            leading: Container(
                              width: SizeConfig.scaleWidth(55),
                              height: SizeConfig.scaleHeight(55),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: App_Color.BUTTON_COLOR,
                              ),
                              child: Center(child: text_medium(text: state.list.first.name,colors: Colors.white,)),
                            ),
                            title: text_medium(text:  state.list.first.name),
                            subtitle: text_medium(text: state.list.first.email,colors: App_Color.FONT_LIGHT_COLOR,),

                          ),
                        ),
                        SizedBox(height: SizeConfig.scaleHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: SizeConfig.scaleWidth(85),
                              height: SizeConfig.scaleHeight(58),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color:Colors.black
                                    ),
                                  ]
                              ),
                              child: Column(
                                children: [
                                  Text_Light(text: 'Categories',textWeight: FontWeight.w500,textSize: 12,color: Colors.black,),
                                  Text_Light(text:  state.list.length.toString(),textWeight: FontWeight.w500,textSize: 12,color: App_Color.FONT_LIGHT_COLOR,),
                                ],
                              ),
                            ),
                            Container(
                              width: SizeConfig.scaleWidth(85),
                              height: SizeConfig.scaleHeight(58),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color:Colors.black
                                    ),
                                  ]
                              ),
                              child: Column(
                                children: [
                                  Text_Light(text: 'Done Notes',textWeight: FontWeight.w500,textSize: 12,color: Colors.black,),
                                  Text_Light(text:  state.list.length.toString(),textWeight: FontWeight.w500,textSize: 12,color: App_Color.FONT_LIGHT_COLOR,),
                                ],
                              ),
                            ),
                            Container(
                              width: SizeConfig.scaleWidth(85),
                              height: SizeConfig.scaleHeight(58),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color:Colors.black
                                    ),
                                  ]
                              ),
                              child: Column(
                                children: [
                                  Text_Light(text: 'Waiting Notes',textWeight: FontWeight.w500,textSize: 12,color: Colors.black,),
                                  Text_Light(text: '14',textWeight: FontWeight.w500,textSize: 12,color: App_Color.FONT_LIGHT_COLOR,),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.scaleHeight(10)),

                        Container(
                          // height: SizeConfig.scaleHeight(400),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [

                              TextField_(hintText: 'First Name'),
                              Divider(color: Colors.grey, thickness: 1, indent: 35, endIndent: 35,height: SizeConfig.scaleHeight(10)),
                              TextField_(hintText: 'Last Name'),
                              Divider(color: Colors.grey, thickness: 1, indent: 35, endIndent: 35,height: SizeConfig.scaleHeight(10)),
                              TextField_(hintText: 'Phone'),
                              Divider(color: Colors.grey, thickness: 1, indent: 35, endIndent: 35,height: SizeConfig.scaleHeight(10)),
                              TextField_(hintText: 'Email'),
                              Divider(color: Colors.grey, thickness: 1, indent: 35, endIndent: 35,height: SizeConfig.scaleHeight(20)),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.scaleHeight(30)),

                        ElevatedButton(onPressed: (){},
                            child: Text_Light(
                              text: 'Save',
                              textWeight: FontWeight.w500,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: App_Color.BUTTON_COLOR,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: Size(double.infinity, SizeConfig.scaleHeight(46)),
                            )
                        ),

                      ],
                    ),
                  ),
                );
              }else if(state is LoadingState){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else{
                return Center(
                  child: Column(
                    children: [
                      Icon(Icons.warning,size: 80,color: Colors.grey,),
                      Text_bold(text: 'No Data Yet.')
                    ],
                  ),
                );
              }
            },

      ),
    );
  }
}
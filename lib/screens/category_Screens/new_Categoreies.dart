

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:notes_ios/Controller/category_dbOperation.dart';
import 'package:notes_ios/bloc/bloc/Catagory_Bloc.dart';
import 'package:notes_ios/bloc/events/crud_events.dart';
import 'package:notes_ios/bloc/states/crud_state.dart';
import 'package:notes_ios/getX/catgories_Getx.dart';
import 'package:notes_ios/models/category.dart';
import 'package:notes_ios/notifers/provider_notifers_catgories.dart';
import 'package:notes_ios/storge/sharedPref.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/helpers.dart';
import 'package:notes_ios/utils/sizeconfig.dart';
import 'package:notes_ios/widgets/text_Field.dart';
import 'package:notes_ios/widgets/text_bold.dart';
import 'package:notes_ios/widgets/text_light.dart';
import 'package:provider/provider.dart';

class Create_And_New_Category_Screen extends StatefulWidget {
  const Create_And_New_Category_Screen({ Key? key }) : super(key: key);

  @override
  _Create_And_New_Category_ScreenState createState() => _Create_And_New_Category_ScreenState();
}

class _Create_And_New_Category_ScreenState extends State<Create_And_New_Category_Screen> with Helpers {

  late TextEditingController category_Contraller;
  late TextEditingController description_Contraller;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    category_Contraller = TextEditingController();
    description_Contraller = TextEditingController();

  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    category_Contraller.dispose();
    description_Contraller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      
      ),
      body: BlocListener<Catagory_bloc , Crud_State>(
        listenWhen: (previous, current) => current is ProcessState && current.processType == ProcessType.create,
        listener: (context, state) {
          state as ProcessState;
          showSnackBar(context, state.massage,error: !state.status);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(26) , right: SizeConfig.scaleWidth(26) ,top: SizeConfig.scaleHeight(26)),
            child: Column(
              children: [
                Text_bold(text: 'New Category'),
                SizedBox(height: SizeConfig.scaleHeight(15)),
                Text_Light(text: 'Create category' ,textSize: 18,),
                TextField_(hintText: 'iOS Category',editingController: category_Contraller,),
                Divider(color: Colors.grey, indent: 33, endIndent: 33, thickness: 1,height: 20,),
                TextField_(hintText: 'Short Description',editingController: description_Contraller,),
                Divider(color: Colors.grey, indent: 33, endIndent: 33, thickness: 1,height: 20,),
                SizedBox(height: SizeConfig.scaleHeight(26)),
                ElevatedButton(
                  onPressed: () {
                     performSave();
                  },
                   child: Text('Save' ,),

                   style: ElevatedButton.styleFrom(
                     minimumSize: Size(double.infinity , SizeConfig.scaleHeight(54)),
                     primary: App_Color.BUTTON_COLOR,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20),
                     )
                   ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void performSave(){
    if (CheckData()) save();
  }
  bool CheckData() {
    if (category_Contraller.text.isNotEmpty&& description_Contraller.text.isNotEmpty){
      return true;

    }else{
      // Helpers.ShowSnackBar(context, 'Please , Enter Data Required',error: true);
    return false;
  }}
  void save() {
        // Catgories_GetXController.to.create(catgorey);
        // Provider.of<Provider_Notifers_Catgories>(context,listen: false).create(catgorey);
        BlocProvider.of<Catagory_bloc>(context).add(Create_Events(catgorey));
        // Helpers.ShowSnackBar(context, 'Save is succssful' );
        clear();
    }


    Catogory get catgorey{
        Catogory cat = Catogory();
        cat.title = category_Contraller.text;
        cat.subTitle = description_Contraller.text;
        cat.user_id = SharedPrefContraller().getKey(key: keyPref.id.toString());
        // cat.id = SharedPrefContraller().getKey(key: keyPref.catgory_id.toString());
        return cat;
    }

   void clear(){
        category_Contraller.text ='';
        description_Contraller.text='';
    }

}
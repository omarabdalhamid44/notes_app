
import 'package:flutter/material.dart';
import 'package:notes_ios/Controller/notes_dbOperation..dart';
import 'package:notes_ios/getX/catgories_Getx.dart';
import 'package:notes_ios/getX/notes_Getx.dart';
import 'package:notes_ios/models/category.dart';
import 'package:notes_ios/models/notes.dart';
import 'package:notes_ios/notifers/notifer_Notes.dart';
import 'package:notes_ios/notifers/provider_notifers_catgories.dart';
import 'package:notes_ios/storge/sharedPref.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/helpers.dart';
import 'package:notes_ios/utils/sizeconfig.dart';
import 'package:notes_ios/widgets/text_Field.dart';
import 'package:notes_ios/widgets/text_bold.dart';
import 'package:notes_ios/widgets/text_light.dart';
import 'package:provider/provider.dart';

class Create_And_New_Notes_Screen extends StatefulWidget {
   Create_And_New_Notes_Screen({ Key? key , this.catogory }) : super(key: key);

  int? catogory;
  @override
  _Create_And_New_Notes_ScreenState createState() => _Create_And_New_Notes_ScreenState();
}

class _Create_And_New_Notes_ScreenState extends State<Create_And_New_Notes_Screen> {
  late TextEditingController note_Contraller;
  late TextEditingController descrip_Note_Contraller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    note_Contraller = TextEditingController();
    descrip_Note_Contraller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    note_Contraller.dispose();
    descrip_Note_Contraller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: SizeConfig.scaleWidth(26),
            right: SizeConfig.scaleWidth(26),
            top: SizeConfig.scaleHeight(23)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text_bold(text: 'New Note'),
              SizedBox(height: SizeConfig.scaleHeight(15)),
              Text_Light(text: 'Create note',
                  textSize: 18,
                  color: App_Color.FONT_LIGHT_COLOR),
              TextField_(
                hintText: 'Note Tile', editingController: note_Contraller,),
              Divider(color: Colors.grey,
                  indent: 33,
                  endIndent: 33,
                  thickness: 1,
                  height: SizeConfig.scaleHeight(20)),
              TextField_(hintText: 'Description',
                editingController: descrip_Note_Contraller,),
              Divider(color: Colors.grey,
                  indent: 33,
                  endIndent: 33,
                  thickness: 1,
                  height: SizeConfig.scaleHeight(20)),
              SizedBox(height: SizeConfig.scaleHeight(26)),
              ElevatedButton(
                onPressed: () async => performSave(),
                child: Text('Save',),

                style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                        double.infinity, SizeConfig.scaleHeight(54)),
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
    );
  }

  Future performSave() async {
    if (CheckData()) save();
  }

  bool CheckData() {
    if (note_Contraller.text.isNotEmpty &&
        descrip_Note_Contraller.text.isNotEmpty) {
      return true;
    } else {
      // showSnackBar(
      //     context, 'Please , Enter Data Required', error: true);
      return false;
    }
  }

  Future save() async {
    Notes_GetController.to.create(notes);
    // Provider.of<Provider_Notifers_Notes>(context, listen: false).create(notes);
    // showSnackBar(context, 'Save is succssful');
    clear();
  }

  Notes get notes {
    Notes notes = Notes();
    notes.name_note = note_Contraller.text;
    notes.description = descrip_Note_Contraller.text;
    notes.id_catgory = widget.catogory!;
    return notes;
  }
  void clear() {
    note_Contraller.text = '';
    descrip_Note_Contraller.text = '';
  }
}
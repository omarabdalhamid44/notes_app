import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_ios/getX/catgories_Getx.dart';
import 'package:notes_ios/getX/notes_Getx.dart';
import 'package:notes_ios/notifers/notifer_Notes.dart';
import 'package:notes_ios/notifers/provider_notifers_catgories.dart';
import 'package:notes_ios/screens/category_Screens/edit_notes.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/sizeconfig.dart';
import 'package:notes_ios/widgets/text_medium.dart';
import 'package:provider/provider.dart';

class Notes_Category_Screen extends StatefulWidget {
  Notes_Category_Screen({Key? key, this.catgoryId}) : super(key: key);

  int? catgoryId;

  @override
  _Notes_Category_ScreenState createState() => _Notes_Category_ScreenState();
}

class _Notes_Category_ScreenState extends State<Notes_Category_Screen> {
  bool isDone = false;
  Notes_GetController controller = Get.put(Notes_GetController());

  @override
  void initState() {
    // TODO: implement initState
    Notes_GetController.to.read(id: widget.catgoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
         Catgories_GetXController.to.providerCatogrey.elementAt(widget.catgoryId!).title,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.scaleTextFont(22),
              color: App_Color.FONT_BOLD_COLOR),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Create_And_New_Notes_Screen(
                            catogory: Catgories_GetXController.to.providerCatogrey.elementAt(widget.catgoryId!).id)));
              },
              icon: Icon(
                Icons.add_circle,
              )),
        ],
      ),
      body: GetBuilder<Notes_GetController>(
        init: Notes_GetController(),
        builder: (controller) {
          if (controller.providerNotes.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(18),
                      right: SizeConfig.scaleWidth(18),
                      top: SizeConfig.scaleHeight(10)),
                  child: Card(
                    elevation: 6,
                    child: ListTile(
                      leading: IconButton(
                          icon: Icon(
                            isDone ? Icons.check_circle : Icons.circle_outlined,
                            color: isDone ? Colors.green : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isDone = !isDone;
                            });
                          }),
                      title: text_medium(
                          text: controller.providerNotes[index].name_note,
                          isDecoration: isDone),
                      subtitle: text_medium(
                        text: controller.providerNotes[index].description,
                        textSize: 12,
                        colors: App_Color.SUB_TITLE_LIST_VIEW_COLOR,
                        isDecoration: isDone,
                      ),
                    ),
                  ),
                );
              },
              itemCount: controller.providerNotes.length,
            );
          } else if (controller.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.yellowAccent,
                    size: 80,
                  )
                ],
              ),
            );
          }

        },
      )
    );
  }
}

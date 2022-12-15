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
import 'package:notes_ios/screens/category_Screens/edit_Categoreies1.dart';
import 'package:notes_ios/screens/category_Screens/edit_notes.dart';
import 'package:notes_ios/screens/category_Screens/new_Categoreies.dart';
import 'package:notes_ios/screens/category_Screens/note_Category.dart';
import 'package:notes_ios/storge/db_Provider.dart';
import 'package:notes_ios/utils/app_color.dart';
import 'package:notes_ios/utils/helpers.dart';
import 'package:notes_ios/utils/sizeconfig.dart';
import 'package:notes_ios/widgets/text_light.dart';
import 'package:provider/provider.dart';

class Categories_Screen extends StatefulWidget {
  const Categories_Screen({Key? key}) : super(key: key);

  @override
  _Categories_ScreenState createState() => _Categories_ScreenState();
}

class _Categories_ScreenState extends State<Categories_Screen>with Helpers {
  // Catgories_GetXController controller = Get.put(Catgories_GetXController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<Catagory_bloc>(context).add(Read_Events());
    // Provider.of<Provider_Notifers_Catgories>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
        'Categories',
        style: TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.scaleTextFont(22),
    color: App_Color.APP_BAR_TITLE_COLOR),
    ),
    actions: [
    IconButton(
    onPressed: () {
    Navigator.pushNamed(context, '/setting_Screen');
    },
    icon: Icon(
    Icons.settings,
    color: Colors.black,
    ),
    ),

    ],
    centerTitle: true,
    ),
    body: BlocListener<Catagory_bloc , Crud_State>(
      listenWhen: (previous, current) => current is ProcessState && current.processType == ProcessType.delete,
      listener: (context , state){
        state as ProcessState;
        showSnackBar(context, state.massage, error: !state.status);
      },
      child: BlocBuilder<Catagory_bloc,Crud_State>(
      buildWhen: (previous, current) => current is ListReadState<Catogory> || current is LoadingState,
      builder: (context , state) {
      if (state is ListReadState && state.list.isNotEmpty) {
          return ListView.builder(
              itemCount:state.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(15),
                      right: SizeConfig.scaleWidth(16)),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 7,
                        margin:
                        EdgeInsets.only(top: SizeConfig.scaleHeight(10)),
                        child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Notes_Category_Screen(
                                            catgoryId: index,
                                          )));
                            },
                            leading: Container(
                              height: SizeConfig.scaleHeight(48),
                              width: SizeConfig.scaleWidth(48),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: App_Color.BUTTON_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  'O',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            title: Text(
                                state.list.elementAt(index).title),
                            subtitle: Text(
                                state.list
                                    .elementAt(index)
                                    .subTitle,
                                style: TextStyle(
                                    color: App_Color.SUB_TITLE_LIST_VIEW_COLOR,
                                    fontSize: 12,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w500)),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                BlocProvider.of<Catagory_bloc>(context).add(Delete_Events(index));
                                print(Delete_Events(index).index);
                              },
                            ),
                            contentPadding: EdgeInsets.only(
                                left: SizeConfig.scaleWidth(15),
                                right: SizeConfig.scaleWidth(30),
                                top: SizeConfig.scaleHeight(5),
                                bottom: SizeConfig.scaleHeight(5))),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: SizeConfig.scaleWidth(30),
                          height: SizeConfig.scaleHeight(150),
                          margin: EdgeInsets.only(
                              top: SizeConfig.scaleHeight(10),
                              bottom: SizeConfig.scaleHeight(0)),
                          decoration: BoxDecoration(
                              color: App_Color.BUTTON_COLOR,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4))),
                          child: Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Edit_Category_Screen(
                                                  catogory:
                                                  state.list[index])));
                                },
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }else if (state is LoadingState){
        return CircularProgressIndicator();
      }
      else {

        return Center(
              child: Column(
              children: [
                    Icon(
                    Icons.warning,
                    color: Colors.yellowAccent,
                    size: 80,)
              ],
              ),
              );
      }

      }),
    ),
    // body: GetX<Catgories_GetXController>
    //   (builder: (controller) {
    //   if (controller.providerCatogrey.isNotEmpty) {
    //     return ListView.builder(
    //         itemCount: controller.providerCatogrey.length,
    //         itemBuilder: (context, index) {
    //           return Padding(
    //             padding: EdgeInsets.only(
    //                 left: SizeConfig.scaleWidth(15),
    //                 right: SizeConfig.scaleWidth(16)),
    //             child: Stack(
    //               children: [
    //                 Card(
    //                   elevation: 7,
    //                   margin:
    //                   EdgeInsets.only(top: SizeConfig.scaleHeight(10)),
    //                   child: ListTile(
    //                       onTap: () {
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) =>
    //                                     Notes_Category_Screen(
    //                                       catgoryId: index,
    //                                     )));
    //                       },
    //                       leading: Container(
    //                         height: SizeConfig.scaleHeight(48),
    //                         width: SizeConfig.scaleWidth(48),
    //                         decoration: BoxDecoration(
    //                           shape: BoxShape.circle,
    //                           color: App_Color.BUTTON_COLOR,
    //                         ),
    //                         child: Center(
    //                           child: Text(
    //                             'O',
    //                             style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontSize: 22,
    //                                 fontFamily: 'Quicksand',
    //                                 fontWeight: FontWeight.w500),
    //                           ),
    //                         ),
    //                       ),
    //                       title: Text(
    //                           controller.providerCatogrey.elementAt(index).title),
    //                       subtitle: Text(
    //                           controller.providerCatogrey
    //                               .elementAt(index)
    //                               .subTitle,
    //                           style: TextStyle(
    //                               color: App_Color.SUB_TITLE_LIST_VIEW_COLOR,
    //                               fontSize: 12,
    //                               fontFamily: 'Quicksand',
    //                               fontWeight: FontWeight.w500)),
    //                       trailing: IconButton(
    //                         icon: Icon(
    //                           Icons.delete,
    //                           color: Colors.red,
    //                         ),
    //                         onPressed: () {
    //                           deleteCatogrey(index);
    //                         },
    //                       ),
    //                       contentPadding: EdgeInsets.only(
    //                           left: SizeConfig.scaleWidth(15),
    //                           right: SizeConfig.scaleWidth(30),
    //                           top: SizeConfig.scaleHeight(5),
    //                           bottom: SizeConfig.scaleHeight(5))),
    //                 ),
    //                 Positioned(
    //                   right: 0,
    //                   bottom: 0,
    //                   top: 0,
    //                   child: Container(
    //                     clipBehavior: Clip.antiAlias,
    //                     width: SizeConfig.scaleWidth(30),
    //                     height: SizeConfig.scaleHeight(150),
    //                     margin: EdgeInsets.only(
    //                         top: SizeConfig.scaleHeight(10),
    //                         bottom: SizeConfig.scaleHeight(0)),
    //                     decoration: BoxDecoration(
    //                         color: App_Color.BUTTON_COLOR,
    //                         borderRadius: BorderRadius.only(
    //                             topRight: Radius.circular(4),
    //                             bottomRight: Radius.circular(4))),
    //                     child: Align(
    //                         alignment: Alignment.center,
    //                         child: IconButton(
    //                           icon: Icon(
    //                             Icons.edit,
    //                             color: Colors.white,
    //                             size: 12,
    //                           ),
    //                           onPressed: () {
    //                             Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                     builder: (context) =>
    //                                         Edit_Category_Screen(
    //                                             catogory:
    //                                             controller.providerCatogrey[
    //                                             index])));
    //                           },
    //                         )),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           );
    //         });
    //   } else if (controller.loading.isTrue) {
    //     return Center(child: CircularProgressIndicator());
    //   } else {
    //     return Center(
    //       child: Column(
    //         children: [
    //           Icon(
    //             Icons.warning,
    //             color: Colors.yellowAccent,
    //             size: 80,
    //           )
    //         ],
    //       ),
    //     );
    //   }
    // },),
    // body: GetBuilder<Catgories_GetXController>(
    //   init: Catgories_GetXController(),
    //   builder: (controller) {
    //     if (controller.providerCatogrey.isNotEmpty) {
    //       return ListView.builder(
    //           itemCount: controller.providerCatogrey.length,
    //           itemBuilder: (context, index) {
    //             return Padding(
    //               padding: EdgeInsets.only(
    //                   left: SizeConfig.scaleWidth(15),
    //                   right: SizeConfig.scaleWidth(16)),
    //               child: Stack(
    //                 children: [
    //                   Card(
    //                     elevation: 7,
    //                     margin:
    //                     EdgeInsets.only(top: SizeConfig.scaleHeight(10)),
    //                     child: ListTile(
    //                         onTap: () {
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) =>
    //                                       Notes_Category_Screen(
    //                                         catgoryId: index,
    //                                       )));
    //                         },
    //                         leading: Container(
    //                           height: SizeConfig.scaleHeight(48),
    //                           width: SizeConfig.scaleWidth(48),
    //                           decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             color: App_Color.BUTTON_COLOR,
    //                           ),
    //                           child: Center(
    //                             child: Text(
    //                               'O',
    //                               style: TextStyle(
    //                                   color: Colors.white,
    //                                   fontSize: 22,
    //                                   fontFamily: 'Quicksand',
    //                                   fontWeight: FontWeight.w500),
    //                             ),
    //                           ),
    //                         ),
    //                         title: Text(
    //                             controller.providerCatogrey.elementAt(index).title),
    //                         subtitle: Text(
    //                             controller.providerCatogrey
    //                                 .elementAt(index)
    //                                 .subTitle,
    //                             style: TextStyle(
    //                                 color: App_Color.SUB_TITLE_LIST_VIEW_COLOR,
    //                                 fontSize: 12,
    //                                 fontFamily: 'Quicksand',
    //                                 fontWeight: FontWeight.w500)),
    //                         trailing: IconButton(
    //                           icon: Icon(
    //                             Icons.delete,
    //                             color: Colors.red,
    //                           ),
    //                           onPressed: () {
    //                             deleteCatogrey(index);
    //                           },
    //                         ),
    //                         contentPadding: EdgeInsets.only(
    //                             left: SizeConfig.scaleWidth(15),
    //                             right: SizeConfig.scaleWidth(30),
    //                             top: SizeConfig.scaleHeight(5),
    //                             bottom: SizeConfig.scaleHeight(5))),
    //                   ),
    //                   Positioned(
    //                     right: 0,
    //                     bottom: 0,
    //                     top: 0,
    //                     child: Container(
    //                       clipBehavior: Clip.antiAlias,
    //                       width: SizeConfig.scaleWidth(30),
    //                       height: SizeConfig.scaleHeight(150),
    //                       margin: EdgeInsets.only(
    //                           top: SizeConfig.scaleHeight(10),
    //                           bottom: SizeConfig.scaleHeight(0)),
    //                       decoration: BoxDecoration(
    //                           color: App_Color.BUTTON_COLOR,
    //                           borderRadius: BorderRadius.only(
    //                               topRight: Radius.circular(4),
    //                               bottomRight: Radius.circular(4))),
    //                       child: Align(
    //                           alignment: Alignment.center,
    //                           child: IconButton(
    //                             icon: Icon(
    //                               Icons.edit,
    //                               color: Colors.white,
    //                               size: 12,
    //                             ),
    //                             onPressed: () {
    //                               Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                       builder: (context) =>
    //                                           Edit_Category_Screen(
    //                                               catogory:
    //                                               controller.providerCatogrey[
    //                                               index])));
    //                             },
    //                           )),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           });
    //     } else if (controller.loading) {
    //       return Center(child: CircularProgressIndicator());
    //     } else {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Icon(
    //               Icons.warning,
    //               color: Colors.yellowAccent,
    //               size: 80,
    //             )
    //           ],
    //         ),
    //       );
    //     }
    //
    //   },
    // ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    Navigator.pushNamed(context, '/edit_category_Screen');
    },
    child: Icon(Icons.add),
    backgroundColor: App_Color.BUTTON_COLOR,
    ),
    );
    }

    // void deleteCatogrey(int index) async {
    // // bool deledted =
    // //     await Provider.of<Provider_Notifers_Catgories>(context, listen: false)
    // //         .delete(index);
    // bool deleted = await Catgories_GetXController.to.delete(index);
    // String mass =
    // deleted ? 'Notes Have Been Deleted ' : 'Deleted Has been Falied';
    // Helpers.ShowSnackBar(context, mass, error: !deleted);
    // }
  }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_ios/bloc/bloc/Catagory_Bloc.dart';
import 'package:notes_ios/bloc/bloc/User_Bloc.dart';
import 'package:notes_ios/bloc/states/crud_state.dart';
import 'package:notes_ios/models/user.dart';
import 'package:notes_ios/notifers/notifer_Notes.dart';
import 'package:notes_ios/notifers/provider_notifers_catgories.dart';
import 'package:notes_ios/notifers/userProviderNotifer.dart';
import 'package:notes_ios/screens/category_Screens/categories.dart';
import 'package:notes_ios/screens/category_Screens/new_Categoreies.dart';
import 'package:notes_ios/screens/category_Screens/edit_notes.dart';
import 'package:notes_ios/screens/category_Screens/note_Category.dart';
import 'package:notes_ios/screens/setting/about_Screen.dart';
import 'package:notes_ios/screens/setting/profile_Screen.dart';
import 'package:notes_ios/screens/setting/settings_Screen.dart';
import 'package:notes_ios/screens/lanach_screen.dart';
import 'package:notes_ios/screens/login_screen.dart';
import 'package:notes_ios/screens/sign_up_screen.dart';
import 'package:notes_ios/storge/db_Provider.dart';
import 'package:notes_ios/storge/sharedPref.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefContraller().initPref();
 await DbProvider().initDB();
  runApp(NotesApp());
}
class NotesApp extends StatefulWidget {
  const NotesApp({ Key? key }) : super(key: key);
  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
 
  @override
  Widget build(BuildContext context) {
  
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => User_BLoc(LoadingState())),
        BlocProvider(create: (context) => Catagory_bloc(LoadingState())),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(

            button: TextStyle(
              fontFamily: 'Roboto' ,
               fontWeight: FontWeight.w500 ,
                fontSize: 20,
                )
          ),

        ),
        debugShowCheckedModeBanner: false,

        initialRoute: '/lanach_Screen',

        routes: {
          '/lanach_Screen' : (context) => Lanach_Screen(),
          '/login_Screen' : (context) => Login_Screen(),
          '/signUp_Screen' : (context) => SignUp_Screen(),
          '/categories_Screen' : (context) =>Categories_Screen(),
          '/note_category_Screen': (context) => Notes_Category_Screen(),
          '/edit_category_Screen' : (context) => Create_And_New_Category_Screen(),
          '/edit_note_Screen': (context) => Create_And_New_Notes_Screen(),
          '/setting_Screen' : (context) => Setting_Screen(),
          '/profile_Screen' : (context) => Profile_Screen(),
          '/about_Screen' : (context) => About_Screen(),
        },

      ),
    );
  }
}
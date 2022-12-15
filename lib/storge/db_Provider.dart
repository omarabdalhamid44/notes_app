
import 'dart:io';

import 'package:notes_ios/utils/constss.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider{
  
  static final DbProvider _instance = DbProvider._internal();

late Database _database ;
  factory DbProvider() {
    return _instance;
  } 

  Database get database  =>  _database;
   DbProvider._internal();

   Future<Database> initDB() async {
     Directory directory = await getApplicationDocumentsDirectory();
     final String path = join(directory.path.toString(), database_Name);
     return _database = await openDatabase(path, version: 1,
         onCreate: (Database db, int version) async {
           await db.execute("CREATE TABLE $table_users("
               "id INTEGER PRIMARY KEY AUTOINCREMENT,"
               "name TEXT,"
               "email TEXT,"
               "password TEXT"
               ")");
           await db.execute("CREATE TABLE $table_Catogry("
               "id INTEGER PRIMARY KEY AUTOINCREMENT,"
               "Title TEXT,"
               "SubTitle TEXT,"
               "user_id INTEGER,"
               "FOREIGN KEY (user_id) REFERENCES $table_users (id) On delete CASCADE On update CASCADE"
               ")");
           await db.execute("CREATE TABLE $table_notes("
               "id INTEGER PRIMARY KEY AUTOINCREMENT,"
               "NoteTitle TEXT,"
               "Description TEXT,"
               "catgorey_id INTEGER,"
               "FOREIGN KEY (catgorey_id) REFERENCES $table_Catogry (id) On delete CASCADE On update CASCADE"
               ")");
         });

   }
}
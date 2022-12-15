import 'package:notes_ios/Controller/db_operations.dart';
import 'package:notes_ios/models/user.dart';
import 'package:notes_ios/storge/db_Provider.dart';
import 'package:notes_ios/storge/sharedPref.dart';
import 'package:notes_ios/utils/constss.dart';
import 'package:sqflite/sqflite.dart';

class User_dbOperation implements Db_Operations<User>{
   Database _database= DbProvider().database;

   Future<bool> login({required String email , required String pass}) async{
      List<Map<String ,dynamic>> userData = await _database.query(table_users,where: 'email = ? AND password = ?',whereArgs: [email,pass]);
      if(userData.isNotEmpty){
        User user =User.fromMap(userData.first);
       await SharedPrefContraller().save(user);
        print('DATA :: ${userData.first}');
      }
      return userData.isNotEmpty;
   }
   @override
   Future<int> create(obejct)async {
     // TODO: implement create

     int value = await _database.insert(table_users, obejct.toMap());
     print('value $value');
     return value;
   }

   @override
   Future<bool> delete(int id)  async{
     // TODO: implement delete
     int countOfDeleteRow = await _database.delete(table_users ,where: 'id = ?', whereArgs: [id]);
     return countOfDeleteRow == 1;
   }

   @override
   Future<List<User>> read() async{
     // TODO: implement read
     List<Map<String , Object?>> data = await _database.query(table_users,where: 'id = ?',whereArgs: [
       SharedPrefContraller().getKey(key: keyPref.id.toString())
     ]);
     print('User $data');
     return data.map((Map<String,dynamic> rowMap) => User.fromMap(rowMap)).toList();
   }

   @override
   Future<bool> update(User obejct) async {
     // TODO: implement update
     int updated = await _database.update(table_users, obejct.toMap() , where: 'id = ?',whereArgs: [obejct.id]);
     return updated == 1;
   }

   @override
   Future<User?> show(int id) async{
     // TODO: implement show
     List<Map<String,dynamic>> rowData = await _database.query(table_Catogry,where: 'id = ?',whereArgs: [id]);
     if(rowData.isNotEmpty){
       return User.fromMap(rowData.first);
     }
     return null;
   }


}
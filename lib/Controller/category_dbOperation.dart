import 'package:notes_ios/Controller/db_operations.dart';
import 'package:notes_ios/models/category.dart';
import 'package:notes_ios/storge/db_Provider.dart';
import 'package:notes_ios/storge/sharedPref.dart';
import 'package:notes_ios/utils/constss.dart';
import 'package:sqflite/sqflite.dart';

class Category_Db_Operation implements Db_Operations<Catogory>{
  Database _database=  DbProvider().database;


  @override
  Future<int> create(obejct)async {
    // TODO: implement create
      int value = await _database.insert(table_Catogry, obejct.toMap());
      print(value);
      return value;
  }
  @override
  Future<bool> delete(int id)  async{
    // TODO: implement delete
    int countOfDeleteRow = await _database.delete(table_Catogry ,where: 'id = ?', whereArgs: [id]);
    return countOfDeleteRow == 1;
  }

  @override
  Future<List<Catogory>> read() async{
    // TODO: implement read
    List<Map<String , Object?>> data = await _database.query(table_Catogry,where: 'user_id = ?',whereArgs: [
      SharedPrefContraller().getKey<int>(key: keyPref.id.toString())
    ]);
    return data.map((Map<String,dynamic> rowMap) => Catogory.fromMap(rowMap)).toList();
  }

  @override
  Future<bool> update(Catogory obejct) async {
    // TODO: implement update
      int updated = await _database.update(table_Catogry, obejct.toMap() , where: 'id = ?',whereArgs: [obejct.id]);
      return updated == 1;
  }

  @override
  Future<Catogory?> show(int id) async{
    // TODO: implement show
    List<Map<String,dynamic>> rowData = await _database.query(table_Catogry,where: 'id = ?',whereArgs: [id]);
    if(rowData.isNotEmpty){
      return Catogory.fromMap(rowData.first);
    }
    return null;
  }


}
import 'package:notes_ios/Controller/db_operations.dart';
import 'package:notes_ios/models/notes.dart';
import 'package:notes_ios/storge/db_Provider.dart';
import 'package:notes_ios/utils/constss.dart';
import 'package:sqflite/sqflite.dart';

class Notes_Db_Operation extends Db_Operations<Notes> {
  Database _database = DbProvider().database;

  @override
  Future<int> create(obejct) async {
    // TODO: implement create
    int value = await _database.insert(table_notes, obejct.toMap());
    return value;
  }

  @override
  Future<bool> delete(int id) async {
    // TODO: implement delete
    return await _database
            .delete(table_notes, where: 'id = ?', whereArgs: [id]) >
        0;
  }

  @override
  Future<List<Notes>> read({int? id}) async {
    // TODO: implement read
    List<Map<String, Object?>> data = await _database
        .query(table_notes, where: 'catgorey_id = ?', whereArgs: [id]);
    return data.map((rowMap) => Notes.fromMap(rowMap)).toList();
  }

  @override
  Future<bool> update(obejct) async {
    // TODO: implement update
    int updated = await _database.update(table_notes, obejct.toMap(),
        where: 'id = ?', whereArgs: [obejct.id]);
    return updated == 1;
  }

  @override
  Future<Notes?> show(int id) async {
    // TODO: implement show
    List<Map<String, dynamic>> rowData = await _database
        .query(table_notes, where: 'catgorey_id = ?', whereArgs: [id]);
    if (rowData.isNotEmpty) {
      return Notes.fromMap(rowData.first);
    }
    return null;
  }
}

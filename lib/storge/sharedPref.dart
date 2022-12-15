import 'package:notes_ios/models/category.dart';
import 'package:notes_ios/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum keyPref{
  logedIn , email , name,id,catgory_id
}
class SharedPrefContraller {
  late SharedPreferences sharedPreferences;
  static final instace = SharedPrefContraller._();

  factory SharedPrefContraller(){
    return instace;
  }
  SharedPrefContraller._();
  Future<void> initPref() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> save(User user) async{
    await sharedPreferences.setBool(keyPref.logedIn.toString(), true);
    await sharedPreferences.setString(keyPref.email.toString() , user.email);
    await sharedPreferences.setInt(keyPref.id.toString() , user.id);
    await sharedPreferences.setString(keyPref.name.toString() , user.name);
  }

  T? getKey<T>({required String key})  {
    return  sharedPreferences.get(key) as T?;
  }
  bool get loggedIn => sharedPreferences.getBool(keyPref.logedIn.toString()) ?? false;
  String get email => sharedPreferences.getString(keyPref.email.toString()) ?? '';

  Future<bool> clear()async{
    return await sharedPreferences.clear();
  }
}

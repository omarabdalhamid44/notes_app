class User{
 late int id;
 late String name;
 late String email;
 late String pass;
  User();
  User.fromMap(Map<String , dynamic> data){
    id = data['id'];
    name = data['name'];
    email = data['email'];
    pass = data['password'];
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> user = <String , dynamic>{};
    user['name'] = name;
    user['email'] = email;
    user['password'] = pass;
    return user;
  }
}
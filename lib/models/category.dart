class Catogory{
   late int id;
   late  String title;
   late  String subTitle;
   late int user_id;


   Catogory();
  Catogory.fromMap(Map<String , dynamic> data){
      id = data['id'];
      title = data['Title'];
      subTitle = data['SubTitle'];
      user_id = data['user_id'];
  }
  Map<String , dynamic> toMap(){
    Map<String , dynamic> data = <String , dynamic>{};
    data['Title'] = title;
    data['SubTitle'] = subTitle;
    data['user_id'] = user_id;
    return data;
  }

}
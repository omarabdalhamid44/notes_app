class Notes{
   late int id;
   late int id_catgory;
   late String name_note;
   late String description;

   Notes();
  Notes.fromMap(Map<String , dynamic> data){
      id = data['id'];
      name_note = data['NoteTitle'];
      description = data['Description'];
      id_catgory = data['catgorey_id'];

  }
  Map<String , Object> toMap(){
    Map<String , Object> data = Map<String , Object>();
    data['NoteTitle'] = name_note;
    data['Description'] = description;
    return data;
  }
    



}